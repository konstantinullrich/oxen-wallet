// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(status) => "${status} Blocks Remaining";

  static m1(node) => "Are you sure to change current node to ${node}?";

  static m2(language) => "Change language to ${language}?";

  static m3(amount, fee) => "Commit transaction\nAmount: ${amount}\nFee: ${fee}";

  static m4(key) => "Copied ${key} to Clipboard";

  static m5(provider) => "Trade for ${provider} is not created. Limits loading failed";

  static m6(provider, max, currency) => "Trade for ${provider} is not created. Amount is more then maximum: ${max} ${currency}";

  static m7(provider, min, currency) => "Trade for ${provider} is not created. Amount is less then minimal: ${min} ${currency}";

  static m8(fetchingLabel, from, walletName) => "By pressing confirm, you will be sending ${fetchingLabel} ${from} from your wallet called ${walletName} to the address shown above. Or you can send from your external wallet to the above address/QR code.\n\nPlease press confirm to continue or go back to change the amounts.\n\n";

  static m9(fetchingLabel, from) => "Please send ${fetchingLabel} ${from} to the address shown above.\n\n";

  static m10(state_error) => "Failed authentication. ${state_error}";

  static m11(value, currency) => "Max: ${value} ${currency}";

  static m12(value, currency) => "Min: ${value} ${currency}";

  static m13(recipient_name) => "You will be sending funds to\n${recipient_name}";

  static m14(title) => "Powered by ${title}";

  static m15(name) => "No route defined for ${name}";

  static m16(transactionPriority) => "Currently the fee is set at ${transactionPriority} priority.\nTransaction priority can be adjusted in the settings";

  static m17(minutes, seconds) => "${minutes}m ${seconds}s";

  static m18(title) => "${title} copied to Clipboard";

  static m19(title) => "Trade for ${title} is not created.";

  static m20(id) => "Trade ID:\n${id}";

  static m21(tradeId, title) => "Trade ${tradeId} of ${title} not found.";

  static m22(provider) => "This trade is powered by ${provider}";

  static m23(title) => "${title} copied to Clipboard";

  static m24(currentVersion) => "Version ${currentVersion}";

  static m25(wallet_name, error) => "Failed to load ${wallet_name} wallet. ${error}";

  static m26(wallet_name, error) => "Failed to remove ${wallet_name} wallet. ${error}";

  static m27(wallet_name) => "Loading ${wallet_name} wallet";

  static m28(wallet_name) => "Removing ${wallet_name} wallet";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Blocks_remaining" : m0,
    "account" : MessageLookupByLibrary.simpleMessage("Account"),
    "accounts" : MessageLookupByLibrary.simpleMessage("Accounts"),
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "add_new_word" : MessageLookupByLibrary.simpleMessage("Add new word"),
    "address_book" : MessageLookupByLibrary.simpleMessage("Address Book"),
    "address_book_menu" : MessageLookupByLibrary.simpleMessage("Address book"),
    "all" : MessageLookupByLibrary.simpleMessage("ALL"),
    "amount" : MessageLookupByLibrary.simpleMessage("Amount: "),
    "amount_is_estimate" : MessageLookupByLibrary.simpleMessage("The receive amount is an estimate"),
    "amount_is_guaranteed" : MessageLookupByLibrary.simpleMessage("The receive amount is guaranteed"),
    "auth_store_ban_timeout" : MessageLookupByLibrary.simpleMessage("ban_timeout"),
    "auth_store_banned_for" : MessageLookupByLibrary.simpleMessage("Banned for "),
    "auth_store_banned_minutes" : MessageLookupByLibrary.simpleMessage(" minutes"),
    "auth_store_incorrect_password" : MessageLookupByLibrary.simpleMessage("Wrong PIN"),
    "authenticated" : MessageLookupByLibrary.simpleMessage("Authenticated"),
    "authentication" : MessageLookupByLibrary.simpleMessage("Authentication"),
    "available_balance" : MessageLookupByLibrary.simpleMessage("Available Balance"),
    "biometric_auth_reason" : MessageLookupByLibrary.simpleMessage("Scan your fingerprint to authenticate"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "change" : MessageLookupByLibrary.simpleMessage("Change"),
    "change_currency" : MessageLookupByLibrary.simpleMessage("Change Currency"),
    "change_current_node" : m1,
    "change_exchange_provider" : MessageLookupByLibrary.simpleMessage("Change Exchange Provider"),
    "change_language" : MessageLookupByLibrary.simpleMessage("Change language"),
    "change_language_to" : m2,
    "clear" : MessageLookupByLibrary.simpleMessage("Clear"),
    "commit_transaction_amount_fee" : m3,
    "confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_sending" : MessageLookupByLibrary.simpleMessage("Confirm sending"),
    "contact" : MessageLookupByLibrary.simpleMessage("Contact"),
    "contact_name" : MessageLookupByLibrary.simpleMessage("Contact Name"),
    "continue_text" : MessageLookupByLibrary.simpleMessage("Continue"),
    "copied_key_to_clipboard" : m4,
    "copied_to_clipboard" : MessageLookupByLibrary.simpleMessage("Copied to Clipboard"),
    "copy" : MessageLookupByLibrary.simpleMessage("Copy"),
    "copy_address" : MessageLookupByLibrary.simpleMessage("Copy Address"),
    "copy_id" : MessageLookupByLibrary.simpleMessage("Copy ID"),
    "create_new" : MessageLookupByLibrary.simpleMessage("Create new"),
    "delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "digit_pin" : MessageLookupByLibrary.simpleMessage("-digit PIN"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "enter_your_pin" : MessageLookupByLibrary.simpleMessage("Enter your PIN"),
    "enter_your_pin_again" : MessageLookupByLibrary.simpleMessage("Enter your pin again"),
    "error" : MessageLookupByLibrary.simpleMessage("Error"),
    "error_text_account_name" : MessageLookupByLibrary.simpleMessage("Account name can only contain letters, numbers\nand must be between 1 and 15 characters long"),
    "error_text_address" : MessageLookupByLibrary.simpleMessage("Wallet address must correspond to the type\nof cryptocurrency"),
    "error_text_amount" : MessageLookupByLibrary.simpleMessage("Amount can only contain numbers"),
    "error_text_contact_name" : MessageLookupByLibrary.simpleMessage("Contact name can\'t contain ` , \' \" symbols\nand must be between 1 and 32 characters long"),
    "error_text_crypto_currency" : MessageLookupByLibrary.simpleMessage("The number of fraction digits\nmust be less or equal to 12"),
    "error_text_fiat" : MessageLookupByLibrary.simpleMessage("Value of amount can\'t exceed available balance.\nThe number of fraction digits must be less or equal to 2"),
    "error_text_keys" : MessageLookupByLibrary.simpleMessage("Wallet keys can only contain 64 chars in hex"),
    "error_text_limits_loading_failed" : m5,
    "error_text_maximum_limit" : m6,
    "error_text_minimal_limit" : m7,
    "error_text_node_address" : MessageLookupByLibrary.simpleMessage("Please enter a iPv4 address"),
    "error_text_node_port" : MessageLookupByLibrary.simpleMessage("Node port can only contain numbers between 0 and 65535"),
    "error_text_oxen" : MessageLookupByLibrary.simpleMessage("OXEN value can\'t exceed available balance.\nThe number of fraction digits must be less or equal to 12"),
    "error_text_payment_id" : MessageLookupByLibrary.simpleMessage("Payment ID can only contain from 16 to 64 chars in hex"),
    "error_text_subaddress_name" : MessageLookupByLibrary.simpleMessage("Subaddress name can\'t contain ` , \' \" symbols\nand must be between 1 and 20 characters long"),
    "error_text_wallet_name" : MessageLookupByLibrary.simpleMessage("Wallet name can only contain letters, numbers\nand must be between 1 and 15 characters long"),
    "estimated" : MessageLookupByLibrary.simpleMessage("Estimated"),
    "exchange" : MessageLookupByLibrary.simpleMessage("Exchange"),
    "exchange_result_confirm" : m8,
    "exchange_result_description" : m9,
    "exchange_result_write_down_ID" : MessageLookupByLibrary.simpleMessage("*Please copy or write down your ID shown above."),
    "exchange_result_write_down_trade_id" : MessageLookupByLibrary.simpleMessage("Please copy or write down the trade ID to continue."),
    "expired" : MessageLookupByLibrary.simpleMessage("Expired"),
    "failed_authentication" : m10,
    "faq" : MessageLookupByLibrary.simpleMessage("FAQ"),
    "fetching" : MessageLookupByLibrary.simpleMessage("Fetching"),
    "filters" : MessageLookupByLibrary.simpleMessage("Filters"),
    "first_wallet_text" : MessageLookupByLibrary.simpleMessage("Awesome wallet\nfor Oxen"),
    "full_balance" : MessageLookupByLibrary.simpleMessage("Full Balance"),
    "hidden_balance" : MessageLookupByLibrary.simpleMessage("Hidden Balance"),
    "id" : MessageLookupByLibrary.simpleMessage("ID: "),
    "incoming" : MessageLookupByLibrary.simpleMessage("Incoming"),
    "incorrect_seed" : MessageLookupByLibrary.simpleMessage("The text entered is not valid."),
    "loading_your_wallet" : MessageLookupByLibrary.simpleMessage("Loading your wallet"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "max_value" : m11,
    "min_value" : m12,
    "new_subaddress_create" : MessageLookupByLibrary.simpleMessage("Create"),
    "new_subaddress_label_name" : MessageLookupByLibrary.simpleMessage("Label name"),
    "new_subaddress_title" : MessageLookupByLibrary.simpleMessage("New subaddress"),
    "new_wallet" : MessageLookupByLibrary.simpleMessage("New Wallet"),
    "node_address" : MessageLookupByLibrary.simpleMessage("Node Address"),
    "node_new" : MessageLookupByLibrary.simpleMessage("New Node"),
    "node_port" : MessageLookupByLibrary.simpleMessage("Node port"),
    "node_reset_settings_title" : MessageLookupByLibrary.simpleMessage("Reset settings"),
    "nodes" : MessageLookupByLibrary.simpleMessage("Nodes"),
    "nodes_list_reset_to_default_message" : MessageLookupByLibrary.simpleMessage("Are you sure that you want to reset settings to default?"),
    "nothing_staked" : MessageLookupByLibrary.simpleMessage("Nothing staked yet"),
    "offer_expires_in" : MessageLookupByLibrary.simpleMessage("Offer expires in: "),
    "ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "openalias_alert_content" : m13,
    "openalias_alert_title" : MessageLookupByLibrary.simpleMessage("OXEN Recipient Detected"),
    "outgoing" : MessageLookupByLibrary.simpleMessage("Outgoing"),
    "oxen_available_balance" : MessageLookupByLibrary.simpleMessage("OXEN Available Balance"),
    "oxen_full_balance" : MessageLookupByLibrary.simpleMessage("OXEN Full Balance"),
    "oxen_hidden" : MessageLookupByLibrary.simpleMessage("OXEN Hidden"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "paste" : MessageLookupByLibrary.simpleMessage("Paste"),
    "payment_id" : MessageLookupByLibrary.simpleMessage("Payment ID: "),
    "pending" : MessageLookupByLibrary.simpleMessage(" (pending)"),
    "pin_is_incorrect" : MessageLookupByLibrary.simpleMessage("PIN is incorrect"),
    "please_make_selection" : MessageLookupByLibrary.simpleMessage("Please make selection below to\ncreate or recover your wallet."),
    "please_select" : MessageLookupByLibrary.simpleMessage("Please select:"),
    "please_try_to_connect_to_another_node" : MessageLookupByLibrary.simpleMessage("Please try to connect to another node"),
    "powered_by" : m14,
    "receive" : MessageLookupByLibrary.simpleMessage("Receive"),
    "receive_amount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "received" : MessageLookupByLibrary.simpleMessage("Received"),
    "reconnect" : MessageLookupByLibrary.simpleMessage("Reconnect"),
    "reconnect_alert_text" : MessageLookupByLibrary.simpleMessage("Are you sure to reconnect?"),
    "reconnection" : MessageLookupByLibrary.simpleMessage("Reconnection"),
    "reload_fiat" : MessageLookupByLibrary.simpleMessage("Reload Fiat data"),
    "remove" : MessageLookupByLibrary.simpleMessage("Remove"),
    "remove_node" : MessageLookupByLibrary.simpleMessage("Remove node"),
    "remove_node_message" : MessageLookupByLibrary.simpleMessage("Are you sure that you want to remove selected node?"),
    "rescan" : MessageLookupByLibrary.simpleMessage("Rescan"),
    "reset" : MessageLookupByLibrary.simpleMessage("Reset"),
    "restore_address" : MessageLookupByLibrary.simpleMessage("Address"),
    "restore_description_from_backup" : MessageLookupByLibrary.simpleMessage("You can restore the whole Oxen Wallet app from your back-up file"),
    "restore_description_from_keys" : MessageLookupByLibrary.simpleMessage("Restore your wallet from generated keystrokes saved from your private keys"),
    "restore_description_from_seed" : MessageLookupByLibrary.simpleMessage("Restore your wallet from either the 25 word or 13 word combination code"),
    "restore_description_from_seed_keys" : MessageLookupByLibrary.simpleMessage("Get back your wallet from seed/keys that you\'ve saved to secure place"),
    "restore_from_seed_placeholder" : MessageLookupByLibrary.simpleMessage("Please enter or paste your seed here"),
    "restore_next" : MessageLookupByLibrary.simpleMessage("Next"),
    "restore_recover" : MessageLookupByLibrary.simpleMessage("Restore"),
    "restore_restore_wallet" : MessageLookupByLibrary.simpleMessage("Restore Wallet"),
    "restore_seed_keys_restore" : MessageLookupByLibrary.simpleMessage("Seed/Keys Restore"),
    "restore_spend_key_private" : MessageLookupByLibrary.simpleMessage("Spend key (private)"),
    "restore_title_from_backup" : MessageLookupByLibrary.simpleMessage("Restore from a back-up file"),
    "restore_title_from_keys" : MessageLookupByLibrary.simpleMessage("Restore from keys"),
    "restore_title_from_seed" : MessageLookupByLibrary.simpleMessage("Restore from seed"),
    "restore_title_from_seed_keys" : MessageLookupByLibrary.simpleMessage("Restore from seed/keys"),
    "restore_view_key_private" : MessageLookupByLibrary.simpleMessage("View key (private)"),
    "restore_wallet" : MessageLookupByLibrary.simpleMessage("Restore wallet"),
    "restore_wallet_name" : MessageLookupByLibrary.simpleMessage("Wallet name"),
    "restore_wallet_restore_description" : MessageLookupByLibrary.simpleMessage("Wallet restore description"),
    "router_no_route" : m15,
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "saved_the_trade_id" : MessageLookupByLibrary.simpleMessage("I\'ve saved the trade ID"),
    "seed_language_chinese" : MessageLookupByLibrary.simpleMessage("Chinese"),
    "seed_language_choose" : MessageLookupByLibrary.simpleMessage("Please choose seed language"),
    "seed_language_dutch" : MessageLookupByLibrary.simpleMessage("Dutch"),
    "seed_language_english" : MessageLookupByLibrary.simpleMessage("English"),
    "seed_language_german" : MessageLookupByLibrary.simpleMessage("German"),
    "seed_language_japanese" : MessageLookupByLibrary.simpleMessage("Japanese"),
    "seed_language_next" : MessageLookupByLibrary.simpleMessage("Next"),
    "seed_language_portuguese" : MessageLookupByLibrary.simpleMessage("Portuguese"),
    "seed_language_russian" : MessageLookupByLibrary.simpleMessage("Russian"),
    "seed_language_spanish" : MessageLookupByLibrary.simpleMessage("Spanish"),
    "seed_share" : MessageLookupByLibrary.simpleMessage("Share seed"),
    "seed_title" : MessageLookupByLibrary.simpleMessage("Seed"),
    "send" : MessageLookupByLibrary.simpleMessage("Send"),
    "send_creating_transaction" : MessageLookupByLibrary.simpleMessage("Creating transaction"),
    "send_error_currency" : MessageLookupByLibrary.simpleMessage("Currency can only contain numbers"),
    "send_error_minimum_value" : MessageLookupByLibrary.simpleMessage("Minimum value of amount is 0.01"),
    "send_estimated_fee" : MessageLookupByLibrary.simpleMessage("Estimated fee:"),
    "send_oxen" : MessageLookupByLibrary.simpleMessage("Send OXEN"),
    "send_oxen_address" : MessageLookupByLibrary.simpleMessage("Oxen address"),
    "send_payment_id" : MessageLookupByLibrary.simpleMessage("Payment ID (optional)"),
    "send_priority" : m16,
    "send_title" : MessageLookupByLibrary.simpleMessage("Send Oxen"),
    "send_your_wallet" : MessageLookupByLibrary.simpleMessage("Your wallet"),
    "sending" : MessageLookupByLibrary.simpleMessage("Sending"),
    "sent" : MessageLookupByLibrary.simpleMessage("Sent"),
    "settings_all" : MessageLookupByLibrary.simpleMessage("ALL"),
    "settings_allow_biometrical_authentication" : MessageLookupByLibrary.simpleMessage("Allow biometrical authentication"),
    "settings_change_language" : MessageLookupByLibrary.simpleMessage("Change language"),
    "settings_change_pin" : MessageLookupByLibrary.simpleMessage("Change PIN"),
    "settings_currency" : MessageLookupByLibrary.simpleMessage("Currency"),
    "settings_current_node" : MessageLookupByLibrary.simpleMessage("Current node"),
    "settings_dark_mode" : MessageLookupByLibrary.simpleMessage("Dark mode"),
    "settings_display_balance_as" : MessageLookupByLibrary.simpleMessage("Display balance as"),
    "settings_display_on_dashboard_list" : MessageLookupByLibrary.simpleMessage("Display on dashboard list"),
    "settings_enable_fiat_currency" : MessageLookupByLibrary.simpleMessage("Enable Fiat Currency conversion"),
    "settings_fee_priority" : MessageLookupByLibrary.simpleMessage("Fee priority"),
    "settings_nodes" : MessageLookupByLibrary.simpleMessage("Nodes"),
    "settings_none" : MessageLookupByLibrary.simpleMessage("None"),
    "settings_only_trades" : MessageLookupByLibrary.simpleMessage("Only trades"),
    "settings_only_transactions" : MessageLookupByLibrary.simpleMessage("Only transactions"),
    "settings_personal" : MessageLookupByLibrary.simpleMessage("Personal"),
    "settings_save_recipient_address" : MessageLookupByLibrary.simpleMessage("Save recipient address"),
    "settings_support" : MessageLookupByLibrary.simpleMessage("Support"),
    "settings_terms_and_conditions" : MessageLookupByLibrary.simpleMessage("Terms and conditions"),
    "settings_title" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settings_trades" : MessageLookupByLibrary.simpleMessage("Trades"),
    "settings_transactions" : MessageLookupByLibrary.simpleMessage("Transactions"),
    "settings_wallets" : MessageLookupByLibrary.simpleMessage("Wallets"),
    "setup_pin" : MessageLookupByLibrary.simpleMessage("Setup PIN"),
    "setup_successful" : MessageLookupByLibrary.simpleMessage("Your PIN has been set up successfully!"),
    "share_address" : MessageLookupByLibrary.simpleMessage("Share address"),
    "show_keys" : MessageLookupByLibrary.simpleMessage("Show keys"),
    "show_seed" : MessageLookupByLibrary.simpleMessage("Show seed"),
    "spend_key_private" : MessageLookupByLibrary.simpleMessage("Spend key (private)"),
    "spend_key_public" : MessageLookupByLibrary.simpleMessage("Spend key (public)"),
    "stake_more" : MessageLookupByLibrary.simpleMessage("Stake more"),
    "start_staking" : MessageLookupByLibrary.simpleMessage("Start staking"),
    "status" : MessageLookupByLibrary.simpleMessage("Status: "),
    "subaddress_title" : MessageLookupByLibrary.simpleMessage("Subaddress list"),
    "subaddresses" : MessageLookupByLibrary.simpleMessage("Subaddresses"),
    "sync_status_connected" : MessageLookupByLibrary.simpleMessage("CONNECTED"),
    "sync_status_connecting" : MessageLookupByLibrary.simpleMessage("CONNECTING"),
    "sync_status_failed_connect" : MessageLookupByLibrary.simpleMessage("FAILED CONNECT TO THE NODE"),
    "sync_status_not_connected" : MessageLookupByLibrary.simpleMessage("NOT CONNECTED"),
    "sync_status_starting_sync" : MessageLookupByLibrary.simpleMessage("STARTING SYNC"),
    "sync_status_syncronized" : MessageLookupByLibrary.simpleMessage("SYNCHRONIZED"),
    "sync_status_syncronizing" : MessageLookupByLibrary.simpleMessage("SYNCHRONIZING"),
    "time" : m17,
    "today" : MessageLookupByLibrary.simpleMessage("Today"),
    "trade_details_copied" : m18,
    "trade_details_created_at" : MessageLookupByLibrary.simpleMessage("Created at"),
    "trade_details_fetching" : MessageLookupByLibrary.simpleMessage("Fetching"),
    "trade_details_id" : MessageLookupByLibrary.simpleMessage("ID"),
    "trade_details_pair" : MessageLookupByLibrary.simpleMessage("Pair"),
    "trade_details_provider" : MessageLookupByLibrary.simpleMessage("Provider"),
    "trade_details_state" : MessageLookupByLibrary.simpleMessage("State"),
    "trade_details_title" : MessageLookupByLibrary.simpleMessage("Trade Details"),
    "trade_for_not_created" : m19,
    "trade_history_title" : MessageLookupByLibrary.simpleMessage("Trade history"),
    "trade_id" : m20,
    "trade_id_not_found" : m21,
    "trade_is_powered_by" : m22,
    "trade_not_created" : MessageLookupByLibrary.simpleMessage("Trade not created."),
    "trade_not_found" : MessageLookupByLibrary.simpleMessage("Trade not found."),
    "trade_state_btc_sent" : MessageLookupByLibrary.simpleMessage("Btc sent"),
    "trade_state_complete" : MessageLookupByLibrary.simpleMessage("Complete"),
    "trade_state_confirming" : MessageLookupByLibrary.simpleMessage("Confirming"),
    "trade_state_created" : MessageLookupByLibrary.simpleMessage("Created"),
    "trade_state_finished" : MessageLookupByLibrary.simpleMessage("Finished"),
    "trade_state_paid" : MessageLookupByLibrary.simpleMessage("Paid"),
    "trade_state_paid_unconfirmed" : MessageLookupByLibrary.simpleMessage("Paid unconfirmed"),
    "trade_state_pending" : MessageLookupByLibrary.simpleMessage("Pending"),
    "trade_state_timeout" : MessageLookupByLibrary.simpleMessage("Timeout"),
    "trade_state_to_be_created" : MessageLookupByLibrary.simpleMessage("To be created"),
    "trade_state_traded" : MessageLookupByLibrary.simpleMessage("Traded"),
    "trade_state_trading" : MessageLookupByLibrary.simpleMessage("Trading"),
    "trade_state_underpaid" : MessageLookupByLibrary.simpleMessage("Underpaid"),
    "trade_state_unpaid" : MessageLookupByLibrary.simpleMessage("Unpaid"),
    "trades" : MessageLookupByLibrary.simpleMessage("Trades"),
    "transaction_details_amount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "transaction_details_copied" : m23,
    "transaction_details_date" : MessageLookupByLibrary.simpleMessage("Date"),
    "transaction_details_height" : MessageLookupByLibrary.simpleMessage("Height"),
    "transaction_details_recipient_address" : MessageLookupByLibrary.simpleMessage("Recipient address"),
    "transaction_details_title" : MessageLookupByLibrary.simpleMessage("Transaction Details"),
    "transaction_details_transaction_id" : MessageLookupByLibrary.simpleMessage("Transaction ID"),
    "transaction_priority_blink" : MessageLookupByLibrary.simpleMessage("Blink"),
    "transaction_priority_slow" : MessageLookupByLibrary.simpleMessage("Slow"),
    "transaction_sent" : MessageLookupByLibrary.simpleMessage("Transaction sent!"),
    "transactions" : MessageLookupByLibrary.simpleMessage("Transactions"),
    "transactions_by_date" : MessageLookupByLibrary.simpleMessage("Transactions by date"),
    "use" : MessageLookupByLibrary.simpleMessage("Switch to "),
    "version" : m24,
    "view_key_private" : MessageLookupByLibrary.simpleMessage("View key (private)"),
    "view_key_public" : MessageLookupByLibrary.simpleMessage("View key (public)"),
    "wallet_keys" : MessageLookupByLibrary.simpleMessage("Wallet keys"),
    "wallet_list_create_new_wallet" : MessageLookupByLibrary.simpleMessage("Create New Wallet"),
    "wallet_list_failed_to_load" : m25,
    "wallet_list_failed_to_remove" : m26,
    "wallet_list_load_wallet" : MessageLookupByLibrary.simpleMessage("Load wallet"),
    "wallet_list_loading_wallet" : m27,
    "wallet_list_removing_wallet" : m28,
    "wallet_list_restore_wallet" : MessageLookupByLibrary.simpleMessage("Restore Wallet"),
    "wallet_list_title" : MessageLookupByLibrary.simpleMessage("Oxen Wallet"),
    "wallet_menu" : MessageLookupByLibrary.simpleMessage("Menu"),
    "wallet_name" : MessageLookupByLibrary.simpleMessage("Wallet name"),
    "wallet_restoration_store_incorrect_seed_length" : MessageLookupByLibrary.simpleMessage("Incorrect seed length"),
    "wallets" : MessageLookupByLibrary.simpleMessage("Wallets"),
    "welcome" : MessageLookupByLibrary.simpleMessage("WELCOME\nTO OXEN WALLET"),
    "widgets_address" : MessageLookupByLibrary.simpleMessage("Address"),
    "widgets_or" : MessageLookupByLibrary.simpleMessage("or"),
    "widgets_restore_from_blockheight" : MessageLookupByLibrary.simpleMessage("Restore from blockheight"),
    "widgets_restore_from_date" : MessageLookupByLibrary.simpleMessage("Restore from date"),
    "widgets_seed" : MessageLookupByLibrary.simpleMessage("Seed"),
    "yesterday" : MessageLookupByLibrary.simpleMessage("Yesterday"),
    "you_will_get" : MessageLookupByLibrary.simpleMessage("You will get"),
    "you_will_send" : MessageLookupByLibrary.simpleMessage("You will send"),
    "your_contributions" : MessageLookupByLibrary.simpleMessage("Your Contributions")
  };
}
