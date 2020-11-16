import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oxen_wallet/src/oxen/transaction_priority.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:oxen_wallet/src/domain/common/node.dart';
import 'package:oxen_wallet/src/domain/common/balance_display_mode.dart';
import 'package:oxen_wallet/src/domain/common/fiat_currency.dart';
import 'package:oxen_wallet/src/stores/action_list/action_list_display_mode.dart';
import 'package:oxen_wallet/src/screens/settings/items/item_headers.dart';
import 'package:oxen_wallet/generated/i18n.dart';
import 'package:oxen_wallet/src/domain/common/default_settings_migration.dart';
import 'package:package_info/package_info.dart';
import 'package:oxen_wallet/src/domain/common/language.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:intl/intl.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  SettingsStoreBase(
      {@required SharedPreferences sharedPreferences,
      @required Box<Node> nodes,
      @required FiatCurrency initialFiatCurrency,
      @required OxenTransactionPriority initialTransactionPriority,
      @required BalanceDisplayMode initialBalanceDisplayMode,
      @required bool initialSaveRecipientAddress,
      @required bool allowBiometricAuthenticationKey,
      // @required bool allowCurrencyRefreshingKey,
      @required bool initialDarkTheme,
      this.actionListDisplayMode,
      @required int initialPinLength,
      @required String initialLanguageCode,
      @required String initialCurrentLocale}) {
    fiatCurrency = initialFiatCurrency;
    transactionPriority = initialTransactionPriority;
    balanceDisplayMode = initialBalanceDisplayMode;
    shouldSaveRecipientAddress = initialSaveRecipientAddress;
    _sharedPreferences = sharedPreferences;
    _nodes = nodes;
    allowBiometricAuthentication = allowBiometricAuthenticationKey;
    // allowCurrencyRefreshing = allowCurrencyRefreshingKey;
    isDarkTheme = initialDarkTheme;
    defaultPinLength = initialPinLength;
    languageCode = initialLanguageCode;
    currentLocale = initialCurrentLocale;
    itemHeaders = {};

    actionListDisplayMode.observe(
        (dynamic _) => _sharedPreferences.setInt(displayActionListModeKey,
            serializeActionListDisplayModes(actionListDisplayMode)),
        fireImmediately: false);

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) => currentVersion = packageInfo.version);

  }

  static const currentNodeIdKey = 'current_node_id';
  static const currentFiatCurrencyKey = 'current_fiat_currency';
  static const currentTransactionPriorityKey = 'current_fee_priority';
  static const currentBalanceDisplayModeKey = 'current_balance_display_mode';
  static const shouldSaveRecipientAddressKey = 'save_recipient_address';
  static const allowBiometricAuthenticationKey =
      'allow_biometric_authentication';
  static const currentDarkTheme = 'dark_theme';
  static const displayActionListModeKey = 'display_list_mode';
  static const currentPinLength = 'current_pin_length';
  static const currentLanguageCode = 'language_code';
  // static const allowCurrencyRefreshingKey = 'allow_currency_refreshing';

  static Future<SettingsStore> load(
      {@required SharedPreferences sharedPreferences,
      @required Box<Node> nodes,
      @required FiatCurrency initialFiatCurrency,
      @required OxenTransactionPriority initialTransactionPriority,
      @required BalanceDisplayMode initialBalanceDisplayMode}) async {
    final currentFiatCurrency = FiatCurrency(
        symbol: sharedPreferences.getString(currentFiatCurrencyKey));
    final currentTransactionPriority = OxenTransactionPriority.deserialize(
        raw: sharedPreferences.getInt(currentTransactionPriorityKey));
    final currentBalanceDisplayMode = BalanceDisplayMode.deserialize(
        raw: sharedPreferences.getInt(currentBalanceDisplayModeKey));
    final shouldSaveRecipientAddress =
        sharedPreferences.getBool(shouldSaveRecipientAddressKey);
    final allowBiometricAuthentication =
        sharedPreferences.getBool(allowBiometricAuthenticationKey) ?? false;
    // final allowCurrencyRefreshing =
    //     sharedPreferences.getBool(allowCurrencyRefreshingKey) ?? false;
    final savedDarkTheme = sharedPreferences.getBool(currentDarkTheme) ?? false;
    final actionListDisplayMode = ObservableList<ActionListDisplayMode>();
    actionListDisplayMode.addAll(deserializeActionListDisplayModes(
        sharedPreferences.getInt(displayActionListModeKey) ?? 11));
    final defaultPinLength = sharedPreferences.getInt(currentPinLength) ?? 4;
    final savedLanguageCode =
        sharedPreferences.getString(currentLanguageCode) ?? await Language.localeDetection();
    final initialCurrentLocale = await Devicelocale.currentLocale;

    final store = SettingsStore(
        sharedPreferences: sharedPreferences,
        nodes: nodes,
        initialFiatCurrency: currentFiatCurrency,
        initialTransactionPriority: currentTransactionPriority,
        initialBalanceDisplayMode: currentBalanceDisplayMode,
        initialSaveRecipientAddress: shouldSaveRecipientAddress,
        allowBiometricAuthenticationKey: allowBiometricAuthentication,
        // allowCurrencyRefreshingKey: allowCurrencyRefreshing,
        initialDarkTheme: savedDarkTheme,
        actionListDisplayMode: actionListDisplayMode,
        initialPinLength: defaultPinLength,
        initialLanguageCode: savedLanguageCode,
        initialCurrentLocale: initialCurrentLocale);

    await store.loadSettings();

    return store;
  }

  @observable
  Node node;

  @observable
  FiatCurrency fiatCurrency;

  @observable
  ObservableList<ActionListDisplayMode> actionListDisplayMode;

  @observable
  OxenTransactionPriority transactionPriority;

  @observable
  BalanceDisplayMode balanceDisplayMode;

  @observable
  bool shouldSaveRecipientAddress;

  @observable
  bool allowBiometricAuthentication;

  // @observable
  // bool allowCurrencyRefreshing;

  @observable
  bool isDarkTheme;

  @observable
  int defaultPinLength;

  String languageCode;

  String currentLocale;

  @observable
  Map<String, String> itemHeaders;

  SharedPreferences _sharedPreferences;
  Box<Node> _nodes;
  String currentVersion;

  @action
  Future setAllowBiometricAuthentication(
      {@required bool allowBiometricAuthentication}) async {
    this.allowBiometricAuthentication = allowBiometricAuthentication;
    await _sharedPreferences.setBool(
        allowBiometricAuthenticationKey, allowBiometricAuthentication);
  }

  // @action
  // Future setAllowCurrencyRefreshingKey(
  //     {@required bool allowCurrencyRefreshing}) async {
  //   this.allowCurrencyRefreshing = allowCurrencyRefreshing;
  //   await _sharedPreferences.setBool(
  //       allowCurrencyRefreshingKey, allowCurrencyRefreshing);
  // }

  @action
  Future saveDarkTheme({@required bool isDarkTheme}) async {
    this.isDarkTheme = isDarkTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: isDarkTheme ? Colors.black : Colors.white));
    await _sharedPreferences.setBool(currentDarkTheme, isDarkTheme);
  }

  @action
  Future saveLanguageCode({@required String languageCode}) async {
    this.languageCode = languageCode;
    await _sharedPreferences.setString(currentLanguageCode, languageCode);
  }

  @action
  Future setCurrentNode({@required Node node}) async {
    this.node = node;
    await _sharedPreferences.setInt(currentNodeIdKey, node.key as int);
  }

  @action
  Future setCurrentFiatCurrency({@required FiatCurrency currency}) async {
    fiatCurrency = currency;
    await _sharedPreferences.setString(
        currentFiatCurrencyKey, fiatCurrency.serialize());
  }

  @action
  Future setCurrentTransactionPriority(
      {@required OxenTransactionPriority priority}) async {
    transactionPriority = priority;
    await _sharedPreferences.setInt(
        currentTransactionPriorityKey, priority.serialize());
  }

  @action
  Future setCurrentBalanceDisplayMode(
      {@required BalanceDisplayMode balanceDisplayMode}) async {
    this.balanceDisplayMode = balanceDisplayMode;
    await _sharedPreferences.setInt(
        currentBalanceDisplayModeKey, balanceDisplayMode.serialize());
  }

  @action
  Future setSaveRecipientAddress(
      {@required bool shouldSaveRecipientAddress}) async {
    this.shouldSaveRecipientAddress = shouldSaveRecipientAddress;
    await _sharedPreferences.setBool(
        shouldSaveRecipientAddressKey, shouldSaveRecipientAddress);
  }

  Future loadSettings() async => node = await _fetchCurrentNode();

  @action
  void toggleTransactionsDisplay() =>
      actionListDisplayMode.contains(ActionListDisplayMode.transactions)
          ? _hideTransaction()
          : _showTransaction();

  @action
  void toggleTradesDisplay() =>
      actionListDisplayMode.contains(ActionListDisplayMode.trades)
          ? _hideTrades()
          : _showTrades();

  @action
  void _hideTransaction() =>
      actionListDisplayMode.remove(ActionListDisplayMode.transactions);

  @action
  void _hideTrades() =>
      actionListDisplayMode.remove(ActionListDisplayMode.trades);

  @action
  void _showTransaction() =>
      actionListDisplayMode.add(ActionListDisplayMode.transactions);

  @action
  void _showTrades() => actionListDisplayMode.add(ActionListDisplayMode.trades);

  @action
  Future setDefaultPinLength({@required int pinLength}) async {
    defaultPinLength = pinLength;
    await _sharedPreferences.setInt(currentPinLength, pinLength);
  }

  Future<Node> _fetchCurrentNode() async {
    final id = _sharedPreferences.getInt(currentNodeIdKey);

    return _nodes.get(id);
  }

  @action
  void setItemHeaders() {
    itemHeaders.clear();
    itemHeaders.addAll({
      ItemHeaders.nodes: S.current.settings_nodes,
      ItemHeaders.currentNode: S.current.settings_current_node,
      ItemHeaders.wallets: S.current.settings_wallets,
      ItemHeaders.displayBalanceAs: S.current.settings_display_balance_as,
      ItemHeaders.currency: S.current.settings_currency,
      ItemHeaders.feePriority: S.current.settings_fee_priority,
      ItemHeaders.saveRecipientAddress:
          S.current.settings_save_recipient_address,
      ItemHeaders.personal: S.current.settings_personal,
      ItemHeaders.changePIN: S.current.settings_change_pin,
      ItemHeaders.changeLanguage: S.current.settings_change_language,
      ItemHeaders.allowBiometricAuthentication:
          S.current.settings_allow_biometrical_authentication,
      // ItemHeaders.allowCurrencyRefreshing:
      //     S.current.settings_allow_currency_refreshing,
      ItemHeaders.darkMode: S.current.settings_dark_mode,
      ItemHeaders.support: S.current.settings_support,
      ItemHeaders.termsAndConditions: S.current.settings_terms_and_conditions,
      ItemHeaders.faq: S.current.faq,
      ItemHeaders.version: S.current.version(currentVersion)
    });
  }

  Future setCurrentNodeToDefault() async {
    await changeCurrentNodeToDefault(sharedPreferences: _sharedPreferences, nodes: _nodes);
    await loadSettings();
  }

  DateFormat getCurrentDateFormat({
    @required String formatUSA,
    @required String formatDefault}) => currentLocale == 'en_US'
          ? DateFormat(formatUSA, languageCode)
          : DateFormat(formatDefault, languageCode);
}
