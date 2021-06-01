import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:oxen_coin/stake.dart' as oxen_stake;
import 'package:oxen_coin/transaction_history.dart' as transaction_history;
import 'package:oxen_coin/wallet.dart' as oxen_wallet;
import 'package:oxen_wallet/src/node/node.dart';
import 'package:oxen_wallet/src/node/sync_status.dart';
import 'package:oxen_wallet/src/wallet/balance.dart';
import 'package:oxen_wallet/src/wallet/oxen/account.dart';
import 'package:oxen_wallet/src/wallet/oxen/account_list.dart';
import 'package:oxen_wallet/src/wallet/oxen/oxen_balance.dart';
import 'package:oxen_wallet/src/wallet/oxen/subaddress.dart';
import 'package:oxen_wallet/src/wallet/oxen/subaddress_list.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/oxen_stake_transaction_creation_credentials.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/oxen_transaction_creation_credentials.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/oxen_transaction_history.dart';
import 'package:oxen_wallet/src/wallet/transaction/pending_transaction.dart';
import 'package:oxen_wallet/src/wallet/transaction/transaction_creation_credentials.dart';
import 'package:oxen_wallet/src/wallet/transaction/transaction_history.dart';
import 'package:oxen_wallet/src/wallet/wallet.dart';
import 'package:oxen_wallet/src/wallet/wallet_info.dart';
import 'package:oxen_wallet/src/wallet/wallet_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synchronized/synchronized.dart';

const oxenBlockSize = 1000;

class OxenWallet extends Wallet {
  OxenWallet({this.walletInfoSource, this.walletInfo}) {
    _cachedBlockchainHeight = 0;
    _name = BehaviorSubject<String>();
    _address = BehaviorSubject<String>();
    _syncStatus = BehaviorSubject<SyncStatus>();
    _onBalanceChange = BehaviorSubject<OxenBalance>();
    _account = BehaviorSubject<Account>()..add(Account(id: 0));
    _subaddress = BehaviorSubject<Subaddress>();
    _synchronizedLock = Lock();
  }

  static Future<OxenWallet> createdWallet(
      {Box<WalletInfo> walletInfoSource,
      String name,
      bool isRecovery = false,
      int restoreHeight = 0}) async {
    const type = WalletType.oxen;
    final id = walletTypeToString(type).toLowerCase() + '_' + name;
    final walletInfo = WalletInfo(
        id: id,
        name: name,
        type: type,
        isRecovery: isRecovery,
        restoreHeight: restoreHeight,
        timestamp: DateTime.now().millisecondsSinceEpoch);
    await walletInfoSource.add(walletInfo);

    return await configured(
        walletInfo: walletInfo, walletInfoSource: walletInfoSource);
  }

  static Future<OxenWallet> load(
      Box<WalletInfo> walletInfoSource, String name, WalletType type) async {
    final id = walletTypeToString(type).toLowerCase() + '_' + name;
    final walletInfo = walletInfoSource.values
        .firstWhere((info) => info.id == id, orElse: () => null);
    return await configured(
        walletInfoSource: walletInfoSource, walletInfo: walletInfo);
  }

  static Future<OxenWallet> configured(
      {@required Box<WalletInfo> walletInfoSource,
      @required WalletInfo walletInfo}) async {
    final wallet =
        OxenWallet(walletInfoSource: walletInfoSource, walletInfo: walletInfo);

    if (walletInfo.isRecovery) {
      wallet.setRecoveringFromSeed();

      if (walletInfo.restoreHeight != null) {
        wallet.setRefreshFromBlockHeight(height: walletInfo.restoreHeight);
      }
    }

    return wallet;
  }

  @override
  String get address => _address.value;

  @override
  String get name => _name.value;

  @override
  WalletType getType() => WalletType.oxen;

  @override
  Observable<SyncStatus> get syncStatus => _syncStatus.stream;

  @override
  Observable<Balance> get onBalanceChange => _onBalanceChange.stream;

  @override
  Observable<String> get onNameChange => _name.stream;

  @override
  Observable<String> get onAddressChange => _address.stream;

  Observable<Account> get onAccountChange => _account.stream;

  Observable<Subaddress> get subaddress => _subaddress.stream;

  bool get isRecovery => walletInfo.isRecovery;

  Account get account => _account.value;

  Box<WalletInfo> walletInfoSource;
  WalletInfo walletInfo;

  oxen_wallet.SyncListener _listener;
  BehaviorSubject<Account> _account;
  BehaviorSubject<OxenBalance> _onBalanceChange;
  BehaviorSubject<SyncStatus> _syncStatus;
  BehaviorSubject<String> _name;
  BehaviorSubject<String> _address;
  BehaviorSubject<Subaddress> _subaddress;
  int _cachedBlockchainHeight;

  TransactionHistory _cachedTransactionHistory;
  SubaddressList _cachedSubaddressList;
  AccountList _cachedAccountList;
  Future<int> _cachedGetNodeHeightOrUpdateRequest;

  Lock _synchronizedLock;

  @override
  Future updateInfo() async {
    _name.value = await getName();
    final acccountList = getAccountList();
    acccountList.refresh();
    _account.value = acccountList.getAll().first;
    final subaddressList = getSubaddress();
    await subaddressList.refresh(
        accountIndex: _account.value != null ? _account.value.id : 0);
    final subaddresses = subaddressList.getAll();
    _subaddress.value = subaddresses.first;
    _address.value = await getAddress();
    setListeners();
  }

  @override
  Future<String> getFilename() async => oxen_wallet.getFilename();

  @override
  Future<String> getName() async => getFilename()
      .then((filename) => filename.split('/'))
      .then((splitted) => splitted.last);

  @override
  Future<String> getAddress() async => oxen_wallet.getAddress(
      accountIndex: _account.value.id, addressIndex: _subaddress.value.id);

  @override
  Future<String> getSeed() async => oxen_wallet.getSeed();

  @override
  int getFullBalance() =>
      oxen_wallet.getFullBalance(accountIndex: _account.value.id);

  @override
  int getUnlockedBalance()  =>
      oxen_wallet.getUnlockedBalance(accountIndex: _account.value.id);

  @override
  int getCurrentHeight() => oxen_wallet.getCurrentHeight();

  @override
  Future<int> getNodeHeight() async {
    _cachedGetNodeHeightOrUpdateRequest ??=
        oxen_wallet.getNodeHeight().then((value) {
      _cachedGetNodeHeightOrUpdateRequest = null;
      return value;
    });

    return _cachedGetNodeHeightOrUpdateRequest;
  }

  @override
  Future<bool> isConnected() async => oxen_wallet.isConnected();

  @override
  Future<Map<String, String>> getKeys() async => {
        'publicViewKey': oxen_wallet.getPublicViewKey(),
        'privateViewKey': oxen_wallet.getSecretViewKey(),
        'publicSpendKey': oxen_wallet.getPublicSpendKey(),
        'privateSpendKey': oxen_wallet.getSecretSpendKey()
      };

  @override
  TransactionHistory getHistory() {
    _cachedTransactionHistory ??= OxenTransactionHistory();

    return _cachedTransactionHistory;
  }

  SubaddressList getSubaddress() {
    _cachedSubaddressList ??= SubaddressList();

    return _cachedSubaddressList;
  }

  AccountList getAccountList() {
    _cachedAccountList ??= AccountList();

    return _cachedAccountList;
  }

  @override
  Future close() async {
    _listener?.stop();
    oxen_wallet.closeCurrentWallet();
    await _name.close();
    await _address.close();
    await _subaddress.close();
  }

  @override
  Future connectToNode(
      {Node node, bool useSSL = false, bool isLightWallet = false}) async {
    try {
      _syncStatus.value = ConnectingSyncStatus();

      // Check if node is online to avoid crash
      final nodeIsOnline = await node.isOnline();
      if (!nodeIsOnline) {
        _syncStatus.value = FailedSyncStatus();
        return;
      }

      await oxen_wallet.setupNode(
          address: node.uri,
          login: node.login,
          password: node.password,
          useSSL: useSSL,
          isLightWallet: isLightWallet);
      _syncStatus.value = ConnectedSyncStatus();
    } catch (e) {
      _syncStatus.value = FailedSyncStatus();
      print(e);
    }
  }

  @override
  Future startSync() async {
    try {
      _setInitialHeight();
    } catch (_) {}

    print('Starting from height: ${getCurrentHeight()}');

    try {
      _syncStatus.value = StartingSyncStatus();
      oxen_wallet.startRefresh();
      _setListeners();
      _listener?.start();
    } catch (e) {
      _syncStatus.value = FailedSyncStatus();
      print(e);
      rethrow;
    }
  }

  Future<int> getNodeHeightOrUpdate(int baseHeight) async {
    if (_cachedBlockchainHeight < baseHeight) {
      _cachedBlockchainHeight = await getNodeHeight();
    }

    return _cachedBlockchainHeight;
  }

  @override
  Future<PendingTransaction> createStake(
      TransactionCreationCredentials credentials) async {
    final _credentials = credentials as OxenStakeTransactionCreationCredentials;
    if (_credentials.amount == null || _credentials.address == null) {
      return Future.error('Amount and address cannot be null.');
    }
    final transactionDescription =
        await oxen_stake.createStake(_credentials.address, _credentials.amount);

    return PendingTransaction.fromTransactionDescription(
        transactionDescription);
  }

  @override
  Future<PendingTransaction> createTransaction(
      TransactionCreationCredentials credentials) async {
    return _synchronizedLock.synchronized(() async {
      final _credentials = credentials as OxenTransactionCreationCredentials;
      final transactionDescription = await transaction_history.createTransaction(
          address: _credentials.address,
          amount: _credentials.amount,
          priorityRaw: _credentials.priority.serialize(),
          accountIndex: _account.value.id);

      return PendingTransaction.fromTransactionDescription(
          transactionDescription);
    });
  }

  @override
  Future rescan({int restoreHeight = 0}) async {
    _syncStatus.value = StartingSyncStatus();
    setRefreshFromBlockHeight(height: restoreHeight);
    oxen_wallet.rescanBlockchainAsync();
    _syncStatus.value = StartingSyncStatus();
  }

  void setRecoveringFromSeed() =>
      oxen_wallet.setRecoveringFromSeed(isRecovery: true);

  void setRefreshFromBlockHeight({int height}) =>
      oxen_wallet.setRefreshFromBlockHeight(height: height);

  Future setAsRecovered() async {
    walletInfo.isRecovery = false;
    await walletInfo.save();
  }

  Future askForUpdateBalance() async {
    await _synchronizedLock.synchronized(() async {
      print('askForUpdateBalance start');
      final fullBalance = getFullBalance();
      final unlockedBalance = getUnlockedBalance();
      final needToChange = _onBalanceChange.value != null
          ? _onBalanceChange.value.fullBalance != fullBalance ||
          _onBalanceChange.value.unlockedBalance != unlockedBalance
          : true;

      if (!needToChange) {
        print('askForUpdateBalance finish');
        return;
      }

      _onBalanceChange.add(OxenBalance(
          fullBalance: fullBalance, unlockedBalance: unlockedBalance));
      print('askForUpdateBalance finish');
    });
  }

  Future askForUpdateTransactionHistory() async {
    await _synchronizedLock.synchronized(() async {
      print('askForUpdateTransactionHistory start');
      await getHistory().update();
      print('askForUpdateTransactionHistory finish');
    });
  }

  void changeCurrentSubaddress(Subaddress subaddress) =>
      _subaddress.value = subaddress;

  void changeAccount(Account account) {
    _account.add(account);

    getSubaddress()
        .refresh(accountIndex: account.id)
        .then((dynamic _) => getSubaddress().getAll())
        .then((subaddresses) => _subaddress.value = subaddresses[0]);
  }

  oxen_wallet.SyncListener setListeners() =>
      oxen_wallet.setListeners(_onNewBlock, _onNewTransaction);

  Future _onNewBlock(int height, int blocksLeft, double ptc) async {
    try {
      await askForUpdateTransactionHistory();
      await askForUpdateBalance();

      if (blocksLeft < 100) {
        _syncStatus.add(SyncedSyncStatus());
        await oxen_wallet.store();

        if (walletInfo.isRecovery) {
          await setAsRecovered();
        }
      } else {
        _syncStatus.add(SyncingSyncStatus(blocksLeft, ptc));
      }

      if (blocksLeft <= 1) {
        oxen_wallet.setRefreshFromBlockHeight(height: height);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _setListeners() {
    _listener?.stop();
    _listener = oxen_wallet.setListeners(_onNewBlock, _onNewTransaction);
  }

  void _setInitialHeight() {
    if (walletInfo.isRecovery) {
      return;
    }

    final currentHeight = getCurrentHeight();

    if (currentHeight <= 1) {
      final height = _getHeightByDate(walletInfo.date);
      oxen_wallet.setRecoveringFromSeed(isRecovery: true);
      oxen_wallet.setRefreshFromBlockHeight(height: height);
    }
  }

  int _getHeightDistance(DateTime date) {
    final distance =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    final daysTmp = (distance / 86400).round();
    final days = daysTmp < 1 ? 1 : daysTmp;

    return days * 1000;
  }

  int _getHeightByDate(DateTime date) {
    final nodeHeight = oxen_wallet.getNodeHeightSync();
    final heightDistance = _getHeightDistance(date);

    if (nodeHeight <= 0) {
      return 0;
    }

    return nodeHeight - heightDistance;
  }

  Future _onNewTransaction() async {
    try {
      await askForUpdateTransactionHistory();
      await askForUpdateBalance();
    } catch (e) {
      print(e.toString());
    }
  }
}
