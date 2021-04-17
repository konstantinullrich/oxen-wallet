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

  static m1(serviceNodeKey) => "Do you really want to unlock your stake from ${serviceNodeKey}?";

  static m2(node) => "Are you sure to change current node to ${node}?";

  static m3(language) => "Change language to ${language}?";

  static m4(amount, fee) => "Commit transaction\nAmount: ${amount}\nFee: ${fee}";

  static m5(key) => "Copied ${key} to Clipboard";

  static m6(item, app_store) => "NEVER input your Oxen wallet ${item} into any software or website other than the OFFICIAL Oxen wallets downloaded directly from the ${app_store}, the Oxen website, or the Oxen GitHub.\nAre you sure you want to access your wallet ${item}?";

  static m7(state_error) => "Failed authentication. ${state_error}";

  static m8(item) => "NEVER give your Oxen wallet ${item} to ANYONE!";

  static m9(recipient_name) => "You will be sending funds to\n${recipient_name}";

  static m10(name) => "No route defined for ${name}";

  static m11(transactionPriority) => "Currently the fee is set at ${transactionPriority} priority.\nTransaction priority can be adjusted in the settings";

  static m12(title) => "${title} copied to Clipboard";

  static m13(currentVersion) => "Version ${currentVersion}";

  static m14(wallet_name, error) => "Failed to load ${wallet_name} wallet. ${error}";

  static m15(wallet_name, error) => "Failed to remove ${wallet_name} wallet. ${error}";

  static m16(wallet_name) => "Loading ${wallet_name} wallet";

  static m17(wallet_name) => "Removing ${wallet_name} wallet";

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
    "amount_detail_detailed" : MessageLookupByLibrary.simpleMessage("4 - Detailed"),
    "amount_detail_none" : MessageLookupByLibrary.simpleMessage("0 - None"),
    "amount_detail_normal" : MessageLookupByLibrary.simpleMessage("2 - Normal"),
    "amount_detail_ultra" : MessageLookupByLibrary.simpleMessage("9 - Ultra"),
    "auth_store_ban_timeout" : MessageLookupByLibrary.simpleMessage("ban_timeout"),
    "auth_store_banned_for" : MessageLookupByLibrary.simpleMessage("Banned for "),
    "auth_store_banned_minutes" : MessageLookupByLibrary.simpleMessage(" minutes"),
    "auth_store_incorrect_password" : MessageLookupByLibrary.simpleMessage("Wrong PIN"),
    "authenticated" : MessageLookupByLibrary.simpleMessage("Authenticated"),
    "authentication" : MessageLookupByLibrary.simpleMessage("Authentication"),
    "available_balance" : MessageLookupByLibrary.simpleMessage("Available Balance"),
    "biometric_auth_reason" : MessageLookupByLibrary.simpleMessage("Scan your fingerprint to authenticate"),
    "body_confirm_unlock_stake" : m1,
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "change" : MessageLookupByLibrary.simpleMessage("Change"),
    "change_current_node" : m2,
    "change_language" : MessageLookupByLibrary.simpleMessage("Change language"),
    "change_language_to" : m3,
    "changelog" : MessageLookupByLibrary.simpleMessage("Changelog"),
    "clear" : MessageLookupByLibrary.simpleMessage("Clear"),
    "commit_transaction_amount_fee" : m4,
    "confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_sending" : MessageLookupByLibrary.simpleMessage("Confirm sending"),
    "contact" : MessageLookupByLibrary.simpleMessage("Contact"),
    "contact_name" : MessageLookupByLibrary.simpleMessage("Contact Name"),
    "continue_text" : MessageLookupByLibrary.simpleMessage("Continue"),
    "copied_key_to_clipboard" : m5,
    "copied_to_clipboard" : MessageLookupByLibrary.simpleMessage("Copied to Clipboard"),
    "copy" : MessageLookupByLibrary.simpleMessage("Copy"),
    "create_new" : MessageLookupByLibrary.simpleMessage("Create new"),
    "dangerzone" : MessageLookupByLibrary.simpleMessage("Dangerzone"),
    "dangerzone_warning" : m6,
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
    "error_text_node_address" : MessageLookupByLibrary.simpleMessage("Please enter a iPv4 address"),
    "error_text_node_port" : MessageLookupByLibrary.simpleMessage("Node port can only contain numbers between 0 and 65535"),
    "error_text_oxen" : MessageLookupByLibrary.simpleMessage("OXEN value can\'t exceed available balance.\nThe number of fraction digits must be less or equal to 12"),
    "error_text_payment_id" : MessageLookupByLibrary.simpleMessage("Payment ID can only contain from 16 to 64 chars in hex"),
    "error_text_service_node" : MessageLookupByLibrary.simpleMessage("A Service Node key can only contain 64 chars in hex"),
    "error_text_subaddress_name" : MessageLookupByLibrary.simpleMessage("Subaddress name can\'t contain ` , \' \" symbols\nand must be between 1 and 20 characters long"),
    "error_text_wallet_name" : MessageLookupByLibrary.simpleMessage("Wallet name can only contain letters, numbers\nand must be between 1 and 15 characters long"),
    "failed_authentication" : m7,
    "faq" : MessageLookupByLibrary.simpleMessage("FAQ"),
    "fetching" : MessageLookupByLibrary.simpleMessage("Fetching"),
    "filters" : MessageLookupByLibrary.simpleMessage("Filters"),
    "first_wallet_text" : MessageLookupByLibrary.simpleMessage("Awesome wallet\nfor Oxen"),
    "full_balance" : MessageLookupByLibrary.simpleMessage("Full Balance"),
    "hidden_balance" : MessageLookupByLibrary.simpleMessage("Hidden Balance"),
    "id" : MessageLookupByLibrary.simpleMessage("ID: "),
    "incoming" : MessageLookupByLibrary.simpleMessage("Incoming"),
    "incorrect_seed" : MessageLookupByLibrary.simpleMessage("The text entered is not valid."),
    "keys_title" : MessageLookupByLibrary.simpleMessage("Keys"),
    "loading_your_wallet" : MessageLookupByLibrary.simpleMessage("Loading your wallet"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "never_give_your" : m8,
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
    "ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "openalias_alert_content" : m9,
    "openalias_alert_title" : MessageLookupByLibrary.simpleMessage("OXEN Recipient Detected"),
    "outgoing" : MessageLookupByLibrary.simpleMessage("Outgoing"),
    "oxen_available_balance" : MessageLookupByLibrary.simpleMessage("OXEN Available Balance"),
    "oxen_full_balance" : MessageLookupByLibrary.simpleMessage("OXEN Full Balance"),
    "oxen_hidden" : MessageLookupByLibrary.simpleMessage("OXEN Hidden"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "paste" : MessageLookupByLibrary.simpleMessage("Paste"),
    "pending" : MessageLookupByLibrary.simpleMessage(" (pending)"),
    "pin_is_incorrect" : MessageLookupByLibrary.simpleMessage("PIN is incorrect"),
    "please_make_selection" : MessageLookupByLibrary.simpleMessage("Please make selection below to\ncreate or recover your wallet."),
    "please_select" : MessageLookupByLibrary.simpleMessage("Please select:"),
    "please_try_to_connect_to_another_node" : MessageLookupByLibrary.simpleMessage("Please try to connect to another node"),
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
    "router_no_route" : m10,
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "seed_language_chinese" : MessageLookupByLibrary.simpleMessage("Chinese"),
    "seed_language_choose" : MessageLookupByLibrary.simpleMessage("Please choose seed language"),
    "seed_language_dutch" : MessageLookupByLibrary.simpleMessage("Dutch"),
    "seed_language_english" : MessageLookupByLibrary.simpleMessage("English"),
    "seed_language_french" : MessageLookupByLibrary.simpleMessage("French"),
    "seed_language_german" : MessageLookupByLibrary.simpleMessage("German"),
    "seed_language_italian" : MessageLookupByLibrary.simpleMessage("Italian"),
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
    "send_estimated_fee" : MessageLookupByLibrary.simpleMessage("Estimated fee:"),
    "send_oxen" : MessageLookupByLibrary.simpleMessage("Send OXEN"),
    "send_oxen_address" : MessageLookupByLibrary.simpleMessage("Oxen address"),
    "send_priority" : m11,
    "send_title" : MessageLookupByLibrary.simpleMessage("Send Oxen"),
    "send_your_wallet" : MessageLookupByLibrary.simpleMessage("Your wallet"),
    "sending" : MessageLookupByLibrary.simpleMessage("Sending"),
    "sent" : MessageLookupByLibrary.simpleMessage("Sent"),
    "service_node_key" : MessageLookupByLibrary.simpleMessage("Service Node Key"),
    "settings_all" : MessageLookupByLibrary.simpleMessage("ALL"),
    "settings_allow_biometric_authentication" : MessageLookupByLibrary.simpleMessage("Allow biometric authentication"),
    "settings_balance_detail" : MessageLookupByLibrary.simpleMessage("Decimals"),
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
    "settings_personal" : MessageLookupByLibrary.simpleMessage("Personal"),
    "settings_save_recipient_address" : MessageLookupByLibrary.simpleMessage("Save recipient address"),
    "settings_support" : MessageLookupByLibrary.simpleMessage("Support"),
    "settings_terms_and_conditions" : MessageLookupByLibrary.simpleMessage("Terms and conditions"),
    "settings_title" : MessageLookupByLibrary.simpleMessage("Settings"),
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
    "stake_oxen" : MessageLookupByLibrary.simpleMessage("Stake Oxen"),
    "start_staking" : MessageLookupByLibrary.simpleMessage("Start staking"),
    "status" : MessageLookupByLibrary.simpleMessage("Status: "),
    "subaddress_title" : MessageLookupByLibrary.simpleMessage("Subaddress list"),
    "subaddresses" : MessageLookupByLibrary.simpleMessage("Subaddresses"),
    "sync_status_connected" : MessageLookupByLibrary.simpleMessage("CONNECTED"),
    "sync_status_connecting" : MessageLookupByLibrary.simpleMessage("CONNECTING"),
    "sync_status_failed_connect" : MessageLookupByLibrary.simpleMessage("FAILED CONNECT TO THE NODE"),
    "sync_status_not_connected" : MessageLookupByLibrary.simpleMessage("NOT CONNECTED"),
    "sync_status_starting_sync" : MessageLookupByLibrary.simpleMessage("STARTING SYNC"),
    "sync_status_synchronized" : MessageLookupByLibrary.simpleMessage("SYNCHRONIZED"),
    "sync_status_synchronizing" : MessageLookupByLibrary.simpleMessage("SYNCHRONIZING"),
    "title_confirm_unlock_stake" : MessageLookupByLibrary.simpleMessage("Unlock Stake"),
    "title_new_stake" : MessageLookupByLibrary.simpleMessage("New Stake"),
    "title_stakes" : MessageLookupByLibrary.simpleMessage("Stakes"),
    "today" : MessageLookupByLibrary.simpleMessage("Today"),
    "transaction_details_amount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "transaction_details_copied" : m12,
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
    "unable_unlock_stake" : MessageLookupByLibrary.simpleMessage("Unable to unlock stake"),
    "unlock_stake_requested" : MessageLookupByLibrary.simpleMessage("Stake unlock requested"),
    "use" : MessageLookupByLibrary.simpleMessage("Switch to "),
    "version" : m13,
    "view_key_private" : MessageLookupByLibrary.simpleMessage("View key (private)"),
    "view_key_public" : MessageLookupByLibrary.simpleMessage("View key (public)"),
    "wallet_keys" : MessageLookupByLibrary.simpleMessage("Wallet keys"),
    "wallet_list_create_new_wallet" : MessageLookupByLibrary.simpleMessage("Create New Wallet"),
    "wallet_list_failed_to_load" : m14,
    "wallet_list_failed_to_remove" : m15,
    "wallet_list_load_wallet" : MessageLookupByLibrary.simpleMessage("Load wallet"),
    "wallet_list_loading_wallet" : m16,
    "wallet_list_removing_wallet" : m17,
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
    "yes_im_sure" : MessageLookupByLibrary.simpleMessage("Yes, I\'m sure!"),
    "yesterday" : MessageLookupByLibrary.simpleMessage("Yesterday"),
    "your_contributions" : MessageLookupByLibrary.simpleMessage("Your Contributions")
  };
}
