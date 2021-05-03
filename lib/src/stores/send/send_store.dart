import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/src/domain/common/crypto_currency.dart';
import 'package:oxen_wallet/src/domain/common/openalias_record.dart';
import 'package:oxen_wallet/src/domain/services/wallet_service.dart';
import 'package:oxen_wallet/src/stores/price/price_store.dart';
import 'package:oxen_wallet/src/stores/send/sending_state.dart';
import 'package:oxen_wallet/src/stores/settings/settings_store.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/oxen_stake_transaction_creation_credentials.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/oxen_transaction_creation_credentials.dart';
import 'package:oxen_wallet/src/wallet/oxen/transaction/transaction_description.dart';
import 'package:oxen_wallet/src/wallet/transaction/pending_transaction.dart';

part 'send_store.g.dart';

class SendStore = SendStoreBase with _$SendStore;

abstract class SendStoreBase with Store {
  SendStoreBase(
      {@required this.walletService,
      this.settingsStore,
      this.transactionDescriptions,
      this.priceStore}) {
    state = SendingStateInitial();
    _pendingTransaction = null;
    _cryptoNumberFormat = NumberFormat()..maximumFractionDigits = 12;
    _fiatNumberFormat = NumberFormat()..maximumFractionDigits = 2;
  }

  WalletService walletService;
  SettingsStore settingsStore;
  PriceStore priceStore;
  Box<TransactionDescription> transactionDescriptions;
  String recordName;
  String recordAddress;

  @observable
  SendingState state;

  @observable
  String fiatAmount;

  @observable
  String cryptoAmount;

  @observable
  bool isValid;

  @observable
  String errorMessage;

  PendingTransaction get pendingTransaction => _pendingTransaction;
  PendingTransaction _pendingTransaction;
  NumberFormat _cryptoNumberFormat;
  NumberFormat _fiatNumberFormat;
  String _lastRecipientAddress;

  @action
  Future createStake({String address, String amount}) async {
    state = CreatingTransaction();

    try {
      final _amount = amount ??
          (cryptoAmount == S.current.all
              ? null
              : cryptoAmount.replaceAll(',', '.'));
      final credentials = OxenStakeTransactionCreationCredentials(
          address: address, amount: _amount);

      _pendingTransaction = await walletService.createStake(credentials);
      state = TransactionCreatedSuccessfully();
    } catch (e) {
      state = SendingFailed(error: e.toString());
    }
  }

  @action
  Future createTransaction({String address, String amount}) async {
    state = CreatingTransaction();

    try {
      final _amount = amount ??
          (cryptoAmount == S.current.all
              ? null
              : cryptoAmount.replaceAll(',', '.'));
      final credentials = OxenTransactionCreationCredentials(
          address: address,
          amount: _amount,
          priority: settingsStore.transactionPriority);

      _pendingTransaction = await walletService.createTransaction(credentials);
      state = TransactionCreatedSuccessfully();
      _lastRecipientAddress = address;
    } catch (e) {
      state = SendingFailed(error: e.toString());
    }
  }

  @action
  Future commitTransaction() async {
    try {
      final transactionId = _pendingTransaction.hash;
      state = TransactionCommitting();
      await _pendingTransaction.commit();
      state = TransactionCommitted();

      if (settingsStore.shouldSaveRecipientAddress) {
        await transactionDescriptions.add(TransactionDescription(
            id: transactionId, recipientAddress: _lastRecipientAddress));
      }
    } catch (e) {
      state = SendingFailed(error: e.toString());
    }

    _pendingTransaction = null;
  }

  @action
  void setSendAll() {
    cryptoAmount = S.current.all;
    fiatAmount = '';
  }

  @action
  void changeCryptoAmount(String amount) {
    cryptoAmount = amount;

    if (cryptoAmount != null && cryptoAmount.isNotEmpty) {
      _calculateFiatAmount();
    } else {
      fiatAmount = '';
    }
  }

  @action
  void changeFiatAmount(String amount) {
    fiatAmount = amount;

    if (fiatAmount != null && fiatAmount.isNotEmpty) {
      _calculateCryptoAmount();
    } else {
      cryptoAmount = '';
    }
  }

  @action
  Future _calculateFiatAmount() async {
    final symbol = PriceStoreBase.generateSymbolForPair(
        fiat: settingsStore.fiatCurrency, crypto: CryptoCurrency.oxen);
    final price = priceStore.prices[symbol] ?? 0;

    try {
      final amount = double.parse(cryptoAmount) * price;
      fiatAmount = _fiatNumberFormat.format(amount);
    } catch (e) {
      fiatAmount = '0.00';
    }
  }

  @action
  Future _calculateCryptoAmount() async {
    final symbol = PriceStoreBase.generateSymbolForPair(
        fiat: settingsStore.fiatCurrency, crypto: CryptoCurrency.oxen);
    final price = priceStore.prices[symbol] ?? 0;

    try {
      final amount = double.parse(fiatAmount) / price;
      cryptoAmount = _cryptoNumberFormat.format(amount);
    } catch (e) {
      cryptoAmount = '0.00';
    }
  }

  Future<bool> isOpenaliasRecord(String name) async {
    final _openaliasRecord = await OpenaliasRecord.fetchAddressAndName(
        OpenaliasRecord.formatDomainName(name));

    recordAddress = _openaliasRecord.address;
    recordName = _openaliasRecord.name;

    return recordAddress != name;
  }

  void validateAddress(String value, {CryptoCurrency cryptoCurrency}) {
    // XMR (95, 106), ADA (59, 92, 105), BCH (42), BNB (42), BTC (34, 42), DASH (34), EOS (42),
    // ETH (42), LTC (34), NANO (64, 65), TRX (34), USDT (42), XLM (56), XRP (34)
    const pattern =
        '^[0-9a-zA-Z]{95}\$|^[0-9a-zA-Z]{34}\$|^[0-9a-zA-Z]{42}\$|^[0-9a-zA-Z]{56}\$|^[0-9a-zA-Z]{59}\$|^[0-9a-zA-Z_]{64}\$|^[0-9a-zA-Z_]{65}\$|^[0-9a-zA-Z]{92}\$|^[0-9a-zA-Z]{105}\$|^[0-9a-zA-Z]{106}\$';
    final regExp = RegExp(pattern);
    isValid = regExp.hasMatch(value);
    if (isValid && cryptoCurrency != null) {
      switch (cryptoCurrency) {
        case CryptoCurrency.oxen:
        case CryptoCurrency.xmr:
          isValid = (value.length == 95) ||
              (value.length == 97) || // Testnet addresses have 2 extra bits indicating the network id
              (value.length == 106);
          break;
        case CryptoCurrency.ada:
          isValid = (value.length == 59) ||
              (value.length == 92) ||
              (value.length == 105);
          break;
        case CryptoCurrency.bch:
          isValid = (value.length == 42);
          break;
        case CryptoCurrency.bnb:
          isValid = (value.length == 42);
          break;
        case CryptoCurrency.btc:
          isValid = (value.length == 34) || (value.length == 42);
          break;
        case CryptoCurrency.dash:
          isValid = (value.length == 34);
          break;
        case CryptoCurrency.eos:
          isValid = (value.length == 42);
          break;
        case CryptoCurrency.eth:
          isValid = (value.length == 42);
          break;
        case CryptoCurrency.ltc:
          isValid = (value.length == 34);
          break;
        case CryptoCurrency.nano:
          isValid = (value.length == 64) || (value.length == 65);
          break;
        case CryptoCurrency.trx:
          isValid = (value.length == 34);
          break;
        case CryptoCurrency.usdt:
          isValid = (value.length == 42);
          break;
        case CryptoCurrency.xlm:
          isValid = (value.length == 56);
          break;
        case CryptoCurrency.xrp:
          isValid = (value.length == 34);
          break;
      }
    }

    isValid = true;
    errorMessage = isValid ? null : S.current.error_text_address;
  }

  void validateOXEN(String amount, int availableBalance) {
    const maxValue = 18446744.073709551616;
    const pattern = '^([0-9]+([.][0-9]{0,12})?|[.][0-9]{1,12})\$|ALL';
    final value = amount.replaceAll(',', '.');
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(value)) {
      if (value == 'ALL') {
        isValid = true;
      } else {
        try {
          final dValue = double.parse(value);
          final maxAvailable = availableBalance;
          isValid =
              (dValue <= maxAvailable && dValue <= maxValue && dValue > 0);
        } catch (e) {
          isValid = false;
        }
      }
    } else {
      isValid = false;
    }

    errorMessage = isValid ? null : S.current.error_text_oxen;
  }

  void validateFiat(String amount, {double maxValue}) {
    const minValue = 0.01;
    final value = amount.replaceAll(',', '.');

    if (value.isEmpty && cryptoAmount == 'ALL') {
      isValid = true;
    } else {
      const pattern = '^([0-9]+([.][0-9]{0,2})?|[.][0-9]{1,2})\$';
      final regExp = RegExp(pattern);

      if (regExp.hasMatch(value)) {
        try {
          final dValue = double.parse(value);
          isValid = (dValue >= minValue && dValue <= maxValue);
        } catch (e) {
          isValid = false;
        }
      } else {
        isValid = false;
      }
    }

    errorMessage = isValid
        ? null
        : 'Value of amount can\'t exceed available balance.\n'
            'The number of fraction digits must be less or equal to 2';
  }
}
