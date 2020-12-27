// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static m0(status) => "\$${status} Verbleibende Blöcke";

  static m1(node) => "Möchten Sie den aktuellen Knoten wirklich auf ändern? \$${node}?";

  static m2(language) => "Ändern Sie die Sprache zu \$${language}?";

  static m3(amount, fee) => "Transaktion festschreiben\nMenge: \$${amount}\nGebühr: \$${fee}";

  static m4(key) => "Kopiert \$${key} Zur Zwischenablage";

  static m5(provider) => "Handel für \$${provider} wird nicht erstellt. Das Laden der Limits ist fehlgeschlagen";

  static m6(provider, max, currency) => "Handel für \$${provider} wird nicht erstellt. Menge ist mehr als maximal: \$${max} \$${currency}";

  static m7(provider, min, currency) => "Handel für \$${provider} wird nicht erstellt. Menge ist weniger als minimal: \$${min} \$${currency}";

  static m8(fetchingLabel, from, walletName) => "Durch Drücken von Bestätigen wird gesendet \$${fetchingLabel} \$${from} von Ihrer Brieftasche aus angerufen \$${walletName} an die oben angegebene Adresse. Oder Sie können von Ihrem externen Portemonnaie an die oben angegebene Adresse / QR-Code senden.\n\nBitte bestätigen Sie, um fortzufahren, oder gehen Sie zurück, um die Beträge zu änderns.\n\n";

  static m9(fetchingLabel, from) => "Bitte senden \$${fetchingLabel} \$${from} an die oben angegebene Adresse.\n\n\'";

  static m10(state_error) => "Authentifizierung fehlgeschlagen. \$${state_error}";

  static m11(value, currency) => "Max: \$${value} \$${currency}";

  static m12(value, currency) => "Mindest: \$${value} \$${currency}";

  static m13(recipient_name) => "Sie senden Geld an\n\$${recipient_name}";

  static m14(title) => "Unterstützt von \$${title}";

  static m15(name) => "Keine Route definiert für \$${name}";

  static m16(transactionPriority) => "Derzeit ist die Gebühr auf \$${transactionPriority} priorität festgelegt.\nDie Transaktionspriorität kann in den Einstellungen angepasst werden";

  static m17(minutes, seconds) => "\$${minutes}m \$${seconds}s";

  static m18(title) => "\$${title} in die Zwischenablage kopiert";

  static m19(title) => "Handel für \$${title} wird nicht erstellt.";

  static m20(id) => "Handel-ID:\n\$${id}";

  static m21(tradeId, title) => "Handel \$${tradeId} von \$${title} nicht gefunden.";

  static m22(provider) => "Dieser Handel wird betrieben von \$${provider}";

  static m23(title) => "\$${title} in die Zwischenablage kopiert";

  static m24(currentVersion) => "Ausführung \$${currentVersion}";

  static m25(wallet_name, error) => "Laden fehlgeschlagen \$${wallet_name} Wallet. \$${error}";

  static m26(wallet_name, error) => "Fehler beim Entfernen \$${wallet_name} Wallet. \$${error}";

  static m27(wallet_name) => "Wird geladen \$${wallet_name} Wallet";

  static m28(wallet_name) => "Entfernen \$${wallet_name} Wallet";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Blocks_remaining" : m0,
    "account" : MessageLookupByLibrary.simpleMessage("Konto"),
    "accounts" : MessageLookupByLibrary.simpleMessage("Konten"),
    "add" : MessageLookupByLibrary.simpleMessage("Hinzufügen"),
    "add_new_word" : MessageLookupByLibrary.simpleMessage("Neues Wort hinzufügen"),
    "address_book" : MessageLookupByLibrary.simpleMessage("Adressbuch"),
    "address_book_menu" : MessageLookupByLibrary.simpleMessage("Adressbuch"),
    "all" : MessageLookupByLibrary.simpleMessage("ALLE"),
    "amount" : MessageLookupByLibrary.simpleMessage("Menge: "),
    "amount_is_estimate" : MessageLookupByLibrary.simpleMessage("Der empfangene Betrag ist eine Schätzung"),
    "amount_is_guaranteed" : MessageLookupByLibrary.simpleMessage("Der Empfangsbetrag ist garantiert"),
    "auth_store_ban_timeout" : MessageLookupByLibrary.simpleMessage("Auszeit verbieten"),
    "auth_store_banned_for" : MessageLookupByLibrary.simpleMessage("Gebannt für "),
    "auth_store_banned_minutes" : MessageLookupByLibrary.simpleMessage(" Protokoll"),
    "auth_store_incorrect_password" : MessageLookupByLibrary.simpleMessage("Falsches PIN"),
    "authenticated" : MessageLookupByLibrary.simpleMessage("Authentifiziert"),
    "authentication" : MessageLookupByLibrary.simpleMessage("Authentifizierung"),
    "available_balance" : MessageLookupByLibrary.simpleMessage("Verfügbares Guthaben"),
    "biometric_auth_reason" : MessageLookupByLibrary.simpleMessage("Scannen Sie Ihren Fingerabdruck zur Authentifizierung"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "change" : MessageLookupByLibrary.simpleMessage("Veränderung"),
    "change_currency" : MessageLookupByLibrary.simpleMessage("Währung ändern"),
    "change_current_node" : m1,
    "change_exchange_provider" : MessageLookupByLibrary.simpleMessage("Wechseln Sie den Exchange-Anbieter"),
    "change_language" : MessageLookupByLibrary.simpleMessage("Sprache ändern"),
    "change_language_to" : m2,
    "clear" : MessageLookupByLibrary.simpleMessage("klar"),
    "commit_transaction_amount_fee" : m3,
    "confirm" : MessageLookupByLibrary.simpleMessage("Bestätigen"),
    "confirm_sending" : MessageLookupByLibrary.simpleMessage("Bestätigen Sie das Senden"),
    "contact" : MessageLookupByLibrary.simpleMessage("Kontakt"),
    "contact_name" : MessageLookupByLibrary.simpleMessage("Name des Ansprechpartners"),
    "continue_text" : MessageLookupByLibrary.simpleMessage("Fortsetzen"),
    "copied_key_to_clipboard" : m4,
    "copied_to_clipboard" : MessageLookupByLibrary.simpleMessage("In die Zwischenablage kopiert"),
    "copy" : MessageLookupByLibrary.simpleMessage("Kopieren"),
    "copy_address" : MessageLookupByLibrary.simpleMessage("Adresse kopieren"),
    "copy_id" : MessageLookupByLibrary.simpleMessage("ID kopieren"),
    "create_new" : MessageLookupByLibrary.simpleMessage("Neu erstellen"),
    "delete" : MessageLookupByLibrary.simpleMessage("Löschen"),
    "digit_pin" : MessageLookupByLibrary.simpleMessage("-stelliger PIN"),
    "edit" : MessageLookupByLibrary.simpleMessage("Bearbeiten"),
    "enter_your_pin" : MessageLookupByLibrary.simpleMessage("PIN eingeben"),
    "enter_your_pin_again" : MessageLookupByLibrary.simpleMessage("Geben Sie Ihre PIN erneut ein"),
    "error" : MessageLookupByLibrary.simpleMessage("Error"),
    "error_text_account_name" : MessageLookupByLibrary.simpleMessage("Der Kontoname darf nur Buchstaben und Zahlen enthalten\nund muss zwischen 1 und 15 Zeichen lang sein"),
    "error_text_address" : MessageLookupByLibrary.simpleMessage("Die Walletadresse muss dem Typ der Kryptowährung \nentsprechen"),
    "error_text_amount" : MessageLookupByLibrary.simpleMessage("Betrag kann nur Zahlen enthalten"),
    "error_text_contact_name" : MessageLookupByLibrary.simpleMessage("Kontaktname darf nicht enthalten sein ` , \' \" Symbole\nund muss zwischen 1 und 32 Zeichen lang sein"),
    "error_text_crypto_currency" : MessageLookupByLibrary.simpleMessage("Die Anzahl der Nachkommastellen\nmuss kleiner oder gleich 12 sein."),
    "error_text_fiat" : MessageLookupByLibrary.simpleMessage("Der Wert des Betrags darf den verfügbaren Kontostand nicht überschreiten.\nDie Anzahl der Nachkommastellen muss kleiner oder gleich 2 sein"),
    "error_text_keys" : MessageLookupByLibrary.simpleMessage("Walletschlüssel können nur 64 hexadezimale Zeichen enthalten"),
    "error_text_limits_loading_failed" : m5,
    "error_text_maximum_limit" : m6,
    "error_text_minimal_limit" : m7,
    "error_text_node_address" : MessageLookupByLibrary.simpleMessage("Bitte geben Sie eine iPv4-Adresse ein"),
    "error_text_node_port" : MessageLookupByLibrary.simpleMessage("Der Knotenport kann nur Nummern zwischen 0 und 65535 enthalten"),
    "error_text_payment_id" : MessageLookupByLibrary.simpleMessage("Die Zahlungs-ID kann nur 16 bis 64 hexadezimale Zeichen enthalten"),
    "error_text_subaddress_name" : MessageLookupByLibrary.simpleMessage("Der Name der Unteradresse darf nicht enthalten sein ` , \' \" symbole\nund muss zwischen 1 und 20 Zeichen lang sein"),
    "error_text_wallet_name" : MessageLookupByLibrary.simpleMessage("Der Wallet darf nur Buchstaben und Zahlen enthalten\nund muss zwischen 1 und 15 Zeichen lang sein"),
    "error_text_xmr" : MessageLookupByLibrary.simpleMessage("Der XMR-Wert kann das verfügbare Guthaben nicht überschreiten.\nDie Anzahl der Nachkommastellen muss kleiner oder gleich 12 sein"),
    "estimated" : MessageLookupByLibrary.simpleMessage("Geschätzt"),
    "exchange" : MessageLookupByLibrary.simpleMessage("Austausch"),
    "exchange_result_confirm" : m8,
    "exchange_result_description" : m9,
    "exchange_result_write_down_ID" : MessageLookupByLibrary.simpleMessage("*Bitte kopieren oder notieren Sie Ihren oben gezeigten Ausweis."),
    "exchange_result_write_down_trade_id" : MessageLookupByLibrary.simpleMessage("Bitte kopieren oder notieren Sie die Handel-ID, um fortzufahren."),
    "expired" : MessageLookupByLibrary.simpleMessage("Abgelaufen"),
    "failed_authentication" : m10,
    "faq" : MessageLookupByLibrary.simpleMessage("FAQ"),
    "fetching" : MessageLookupByLibrary.simpleMessage("holen"),
    "filters" : MessageLookupByLibrary.simpleMessage("Filter"),
    "first_wallet_text" : MessageLookupByLibrary.simpleMessage("Das tolle Wallet\nfür Oxen"),
    "full_balance" : MessageLookupByLibrary.simpleMessage("Volle Balance"),
    "hidden_balance" : MessageLookupByLibrary.simpleMessage("Verstecktes Gleichgewicht"),
    "id" : MessageLookupByLibrary.simpleMessage("ID: "),
    "incoming" : MessageLookupByLibrary.simpleMessage("Eingehend"),
    "incorrect_seed" : MessageLookupByLibrary.simpleMessage("Der eingegebene Text ist ungültig."),
    "loading_your_wallet" : MessageLookupByLibrary.simpleMessage("Wallet wird geladen"),
    "login" : MessageLookupByLibrary.simpleMessage("Einloggen"),
    "max_value" : m11,
    "min_value" : m12,
    "new_subaddress_create" : MessageLookupByLibrary.simpleMessage("Erstellen"),
    "new_subaddress_label_name" : MessageLookupByLibrary.simpleMessage("Markenname"),
    "new_subaddress_title" : MessageLookupByLibrary.simpleMessage("Neue Unteradresse"),
    "new_wallet" : MessageLookupByLibrary.simpleMessage("Neues Wallet"),
    "node_address" : MessageLookupByLibrary.simpleMessage("Knotenadresse"),
    "node_new" : MessageLookupByLibrary.simpleMessage("Neuer Knoten"),
    "node_port" : MessageLookupByLibrary.simpleMessage("Knotenport"),
    "node_reset_settings_title" : MessageLookupByLibrary.simpleMessage("Einstellungen zurücksetzen"),
    "nodes" : MessageLookupByLibrary.simpleMessage("Knoten"),
    "nodes_list_reset_to_default_message" : MessageLookupByLibrary.simpleMessage("Möchten Sie die Einstellungen wirklich auf die Standardeinstellungen zurücksetzen?"),
    "offer_expires_in" : MessageLookupByLibrary.simpleMessage("Angebot läuft ab in: "),
    "ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "openalias_alert_content" : m13,
    "openalias_alert_title" : MessageLookupByLibrary.simpleMessage("OXEN-Empfänger erkannt"),
    "outgoing" : MessageLookupByLibrary.simpleMessage("Ausgehend"),
    "password" : MessageLookupByLibrary.simpleMessage("Passwort"),
    "paste" : MessageLookupByLibrary.simpleMessage("Einfügen"),
    "payment_id" : MessageLookupByLibrary.simpleMessage("Zahlungs ID: "),
    "pending" : MessageLookupByLibrary.simpleMessage(" (steht aus)"),
    "pin_is_incorrect" : MessageLookupByLibrary.simpleMessage("PIN ist falsch"),
    "please_make_selection" : MessageLookupByLibrary.simpleMessage("Bitte treffen Sie unten eine Auswahl zu\nErstellen oder Wiederherstellen Ihres Wallets."),
    "please_select" : MessageLookupByLibrary.simpleMessage("Bitte auswählen:"),
    "please_try_to_connect_to_another_node" : MessageLookupByLibrary.simpleMessage("Bitte versuchen Sie, eine Verbindung zu einem anderen Knoten herzustellen"),
    "powered_by" : m14,
    "receive" : MessageLookupByLibrary.simpleMessage("Erhalten"),
    "receive_amount" : MessageLookupByLibrary.simpleMessage("Menge"),
    "received" : MessageLookupByLibrary.simpleMessage("Empfangen"),
    "reconnect" : MessageLookupByLibrary.simpleMessage("Erneut verbinden"),
    "reconnect_alert_text" : MessageLookupByLibrary.simpleMessage("Sind Sie sicher, dass Sie die Verbindung wiederherstellen möchten?"),
    "reconnection" : MessageLookupByLibrary.simpleMessage("Wiederverbindung"),
    "remove" : MessageLookupByLibrary.simpleMessage("Löschen"),
    "remove_node" : MessageLookupByLibrary.simpleMessage("Knoten entfernen"),
    "remove_node_message" : MessageLookupByLibrary.simpleMessage("Möchten Sie den ausgewählten Knoten wirklich entfernen?"),
    "rescan" : MessageLookupByLibrary.simpleMessage("Erneut scannen"),
    "reset" : MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
    "restore_address" : MessageLookupByLibrary.simpleMessage("Adresse"),
    "restore_description_from_backup" : MessageLookupByLibrary.simpleMessage("Sie können die gesamte Oxen Wallet-App aus ihrer Sicherungsdatei wiederherstellen."),
    "restore_description_from_keys" : MessageLookupByLibrary.simpleMessage("Stellen Sie Ihr Wallet von generiert wieder her Tastenanschläge, die von Ihren privaten Schlüsseln gespeichert wurden"),
    "restore_description_from_seed" : MessageLookupByLibrary.simpleMessage("Stellen Sie Ihr Wallet aus den 25 Wörtern wieder her oder 13-Wort-Kombinationscode"),
    "restore_description_from_seed_keys" : MessageLookupByLibrary.simpleMessage("Holen Sie sich Ihr Wallet von Seed / Schlüsseln zurück, die Sie an einem sicheren Ort aufbewahrt haben"),
    "restore_from_seed_placeholder" : MessageLookupByLibrary.simpleMessage("Bitte geben Sie hier Ihren Code ein"),
    "restore_next" : MessageLookupByLibrary.simpleMessage("Nächster"),
    "restore_recover" : MessageLookupByLibrary.simpleMessage("Wiederherstellen"),
    "restore_restore_wallet" : MessageLookupByLibrary.simpleMessage("Wallet wiederherstellen"),
    "restore_seed_keys_restore" : MessageLookupByLibrary.simpleMessage("Seed / Schlüssel wiederherstellen"),
    "restore_spend_key_private" : MessageLookupByLibrary.simpleMessage("Schlüssel ausgeben (geheim)"),
    "restore_title_from_backup" : MessageLookupByLibrary.simpleMessage("Aus einer Sicherungsdatei wiederherstellen"),
    "restore_title_from_keys" : MessageLookupByLibrary.simpleMessage("Wiederherstellen von Schlüsseln"),
    "restore_title_from_seed" : MessageLookupByLibrary.simpleMessage("Aus Seed wiederherstellen"),
    "restore_title_from_seed_keys" : MessageLookupByLibrary.simpleMessage("Vom Seed / Schlüssel wiederherstellen"),
    "restore_view_key_private" : MessageLookupByLibrary.simpleMessage("Schlüssel anzeigen(geheim)"),
    "restore_wallet" : MessageLookupByLibrary.simpleMessage("Wallet wiederherstellen"),
    "restore_wallet_name" : MessageLookupByLibrary.simpleMessage("Walletname"),
    "restore_wallet_restore_description" : MessageLookupByLibrary.simpleMessage("Beschreibung zur Wiederherstellung des Wallets"),
    "router_no_route" : m15,
    "save" : MessageLookupByLibrary.simpleMessage("speichern"),
    "saved_the_trade_id" : MessageLookupByLibrary.simpleMessage("Ich habe die Geschäfts-ID gespeichert"),
    "seed_language_chinese" : MessageLookupByLibrary.simpleMessage("Chinesisch"),
    "seed_language_choose" : MessageLookupByLibrary.simpleMessage("Bitte wählen Sie die Ausgangssprache"),
    "seed_language_dutch" : MessageLookupByLibrary.simpleMessage("Niederländisch"),
    "seed_language_english" : MessageLookupByLibrary.simpleMessage("Englisch"),
    "seed_language_german" : MessageLookupByLibrary.simpleMessage("Deutsch"),
    "seed_language_japanese" : MessageLookupByLibrary.simpleMessage("Japanisch"),
    "seed_language_next" : MessageLookupByLibrary.simpleMessage("Nächster"),
    "seed_language_portuguese" : MessageLookupByLibrary.simpleMessage("Portugiesisch"),
    "seed_language_russian" : MessageLookupByLibrary.simpleMessage("Russisch"),
    "seed_language_spanish" : MessageLookupByLibrary.simpleMessage("Spanisch"),
    "seed_share" : MessageLookupByLibrary.simpleMessage("Teilen Sie Seed"),
    "seed_title" : MessageLookupByLibrary.simpleMessage("Seed"),
    "send" : MessageLookupByLibrary.simpleMessage("Senden"),
    "send_creating_transaction" : MessageLookupByLibrary.simpleMessage("Transaktion erstellen"),
    "send_error_currency" : MessageLookupByLibrary.simpleMessage("Die Währung kann nur Zahlen enthalten"),
    "send_error_minimum_value" : MessageLookupByLibrary.simpleMessage("Der Mindestbetrag beträgt 0,01"),
    "send_estimated_fee" : MessageLookupByLibrary.simpleMessage("Geschätzte Gebühr:"),
    "send_monero_address" : MessageLookupByLibrary.simpleMessage("Oxen-Adresse"),
    "send_payment_id" : MessageLookupByLibrary.simpleMessage("Zahlungs ID (wahlweise)"),
    "send_priority" : m16,
    "send_title" : MessageLookupByLibrary.simpleMessage("Senden Sie Oxen"),
    "send_xmr" : MessageLookupByLibrary.simpleMessage("Senden XMR"),
    "send_your_wallet" : MessageLookupByLibrary.simpleMessage("Dein Wallet"),
    "sending" : MessageLookupByLibrary.simpleMessage("Senden"),
    "sent" : MessageLookupByLibrary.simpleMessage("Geschickt"),
    "settings_all" : MessageLookupByLibrary.simpleMessage("ALLE"),
    "settings_allow_biometrical_authentication" : MessageLookupByLibrary.simpleMessage("Biometrische Authentifizierung zulassen"),
    "settings_change_language" : MessageLookupByLibrary.simpleMessage("Sprache ändern"),
    "settings_change_pin" : MessageLookupByLibrary.simpleMessage("PIN ändern"),
    "settings_currency" : MessageLookupByLibrary.simpleMessage("Währung"),
    "settings_current_node" : MessageLookupByLibrary.simpleMessage("Aktueller Knoten"),
    "settings_dark_mode" : MessageLookupByLibrary.simpleMessage("Dunkler Modus"),
    "settings_display_balance_as" : MessageLookupByLibrary.simpleMessage("Kontostand anzeigen als"),
    "settings_display_on_dashboard_list" : MessageLookupByLibrary.simpleMessage("Anzeige in der Dashboard-Liste"),
    "settings_fee_priority" : MessageLookupByLibrary.simpleMessage("Gebührenpriorität"),
    "settings_nodes" : MessageLookupByLibrary.simpleMessage("Knoten"),
    "settings_none" : MessageLookupByLibrary.simpleMessage("Keiner"),
    "settings_only_trades" : MessageLookupByLibrary.simpleMessage("Nur Trades"),
    "settings_only_transactions" : MessageLookupByLibrary.simpleMessage("Nur Transaktionen"),
    "settings_personal" : MessageLookupByLibrary.simpleMessage("persönlich"),
    "settings_save_recipient_address" : MessageLookupByLibrary.simpleMessage("Empfängeradresse speichern"),
    "settings_support" : MessageLookupByLibrary.simpleMessage("Unterstützung"),
    "settings_terms_and_conditions" : MessageLookupByLibrary.simpleMessage("Geschäftsbedingungen"),
    "settings_title" : MessageLookupByLibrary.simpleMessage("die Einstellungen"),
    "settings_trades" : MessageLookupByLibrary.simpleMessage("Handel"),
    "settings_transactions" : MessageLookupByLibrary.simpleMessage("Transaktionen"),
    "settings_wallets" : MessageLookupByLibrary.simpleMessage("Brieftaschen"),
    "setup_pin" : MessageLookupByLibrary.simpleMessage("PIN einrichten"),
    "setup_successful" : MessageLookupByLibrary.simpleMessage("Ihre PIN wurde erfolgreich eingerichtet!"),
    "share_address" : MessageLookupByLibrary.simpleMessage("Adresse teilen "),
    "show_keys" : MessageLookupByLibrary.simpleMessage("Schlüssel anzeigen"),
    "show_seed" : MessageLookupByLibrary.simpleMessage("Seed zeigen"),
    "spend_key_private" : MessageLookupByLibrary.simpleMessage("Schlüssel ausgeben (geheim)"),
    "spend_key_public" : MessageLookupByLibrary.simpleMessage("Schlüssel ausgeben (Öffentlichkeit)"),
    "status" : MessageLookupByLibrary.simpleMessage("Status: "),
    "subaddress_title" : MessageLookupByLibrary.simpleMessage("Unteradressenliste"),
    "subaddresses" : MessageLookupByLibrary.simpleMessage("Unteradressen"),
    "sync_status_connected" : MessageLookupByLibrary.simpleMessage("IN VERBINDUNG GEBRACHT"),
    "sync_status_connecting" : MessageLookupByLibrary.simpleMessage("ANSCHLUSS"),
    "sync_status_failed_connect" : MessageLookupByLibrary.simpleMessage("Verbindung zum Knoten fehlgeschlagen"),
    "sync_status_not_connected" : MessageLookupByLibrary.simpleMessage("NICHT VERBUNDEN"),
    "sync_status_starting_sync" : MessageLookupByLibrary.simpleMessage("STARTEN DER SYNCHRONISIERUNG"),
    "sync_status_syncronized" : MessageLookupByLibrary.simpleMessage("SYNCHRONISIERT"),
    "sync_status_syncronizing" : MessageLookupByLibrary.simpleMessage("SYNCHRONISIERUNG"),
    "time" : m17,
    "today" : MessageLookupByLibrary.simpleMessage("Heute"),
    "trade_details_copied" : m18,
    "trade_details_created_at" : MessageLookupByLibrary.simpleMessage("Hergestellt in"),
    "trade_details_fetching" : MessageLookupByLibrary.simpleMessage("Holen"),
    "trade_details_id" : MessageLookupByLibrary.simpleMessage("ID"),
    "trade_details_pair" : MessageLookupByLibrary.simpleMessage("Paar"),
    "trade_details_provider" : MessageLookupByLibrary.simpleMessage("Anbieter"),
    "trade_details_state" : MessageLookupByLibrary.simpleMessage("Zustand"),
    "trade_details_title" : MessageLookupByLibrary.simpleMessage("Handel Einzelheiten"),
    "trade_for_not_created" : m19,
    "trade_history_title" : MessageLookupByLibrary.simpleMessage("Handelsgeschichte"),
    "trade_id" : m20,
    "trade_id_not_found" : m21,
    "trade_is_powered_by" : m22,
    "trade_not_created" : MessageLookupByLibrary.simpleMessage("Handel nicht angelegt."),
    "trade_not_found" : MessageLookupByLibrary.simpleMessage("Handel nicht gefunden."),
    "trade_state_btc_sent" : MessageLookupByLibrary.simpleMessage("geschickt"),
    "trade_state_complete" : MessageLookupByLibrary.simpleMessage("Komplett"),
    "trade_state_confirming" : MessageLookupByLibrary.simpleMessage("Bestätigung"),
    "trade_state_created" : MessageLookupByLibrary.simpleMessage("Erstellt"),
    "trade_state_finished" : MessageLookupByLibrary.simpleMessage("Fertig"),
    "trade_state_paid" : MessageLookupByLibrary.simpleMessage("Bezahlt"),
    "trade_state_paid_unconfirmed" : MessageLookupByLibrary.simpleMessage("Unbestätigt bezahlt"),
    "trade_state_pending" : MessageLookupByLibrary.simpleMessage("Steht aus"),
    "trade_state_timeout" : MessageLookupByLibrary.simpleMessage("Auszeit"),
    "trade_state_to_be_created" : MessageLookupByLibrary.simpleMessage("Geschaffen werden"),
    "trade_state_traded" : MessageLookupByLibrary.simpleMessage("Handeln"),
    "trade_state_trading" : MessageLookupByLibrary.simpleMessage("Handel"),
    "trade_state_underpaid" : MessageLookupByLibrary.simpleMessage("Unterbezahlt"),
    "trade_state_unpaid" : MessageLookupByLibrary.simpleMessage("Unbezahlt"),
    "trades" : MessageLookupByLibrary.simpleMessage("Handel"),
    "transaction_details_amount" : MessageLookupByLibrary.simpleMessage("Menge"),
    "transaction_details_copied" : m23,
    "transaction_details_date" : MessageLookupByLibrary.simpleMessage("Datum"),
    "transaction_details_height" : MessageLookupByLibrary.simpleMessage("Höhe"),
    "transaction_details_recipient_address" : MessageLookupByLibrary.simpleMessage("Empfängeradresse"),
    "transaction_details_title" : MessageLookupByLibrary.simpleMessage("Transaktionsdetails"),
    "transaction_details_transaction_id" : MessageLookupByLibrary.simpleMessage("Transaktions-ID"),
    "transaction_priority_slow" : MessageLookupByLibrary.simpleMessage("Schleppend"),
    "transaction_sent" : MessageLookupByLibrary.simpleMessage("Transaktion gesendet!"),
    "transactions" : MessageLookupByLibrary.simpleMessage("Transaktionen"),
    "transactions_by_date" : MessageLookupByLibrary.simpleMessage("Transaktionen nach Datum"),
    "use" : MessageLookupByLibrary.simpleMessage("Wechseln zu "),
    "version" : m24,
    "view_key_private" : MessageLookupByLibrary.simpleMessage("Schlüssel anzeigen (eheim)"),
    "view_key_public" : MessageLookupByLibrary.simpleMessage("Schlüssel anzeigen (Öffentlichkeit)"),
    "wallet_keys" : MessageLookupByLibrary.simpleMessage("Wallet schlüssel"),
    "wallet_list_create_new_wallet" : MessageLookupByLibrary.simpleMessage("Neue Wallet erstellen"),
    "wallet_list_failed_to_load" : m25,
    "wallet_list_failed_to_remove" : m26,
    "wallet_list_load_wallet" : MessageLookupByLibrary.simpleMessage("Wallet einlegen"),
    "wallet_list_loading_wallet" : m27,
    "wallet_list_removing_wallet" : m28,
    "wallet_list_restore_wallet" : MessageLookupByLibrary.simpleMessage("Wallet wiederherstellen"),
    "wallet_list_title" : MessageLookupByLibrary.simpleMessage("Monero Wallet"),
    "wallet_menu" : MessageLookupByLibrary.simpleMessage("Wallet-Menü"),
    "wallet_name" : MessageLookupByLibrary.simpleMessage("Walletname"),
    "wallet_restoration_store_incorrect_seed_length" : MessageLookupByLibrary.simpleMessage("Falsche Seed-länge"),
    "wallet_store_monero_wallet" : MessageLookupByLibrary.simpleMessage("Monero Wallet"),
    "wallets" : MessageLookupByLibrary.simpleMessage("Wallets"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Willkommen\nim OXEN WALLET"),
    "widgets_address" : MessageLookupByLibrary.simpleMessage("Adresse"),
    "widgets_or" : MessageLookupByLibrary.simpleMessage("oder"),
    "widgets_restore_from_blockheight" : MessageLookupByLibrary.simpleMessage("Aus Blockhöhe wiederherstellen"),
    "widgets_restore_from_date" : MessageLookupByLibrary.simpleMessage("Vom Datum wiederherstellen"),
    "widgets_seed" : MessageLookupByLibrary.simpleMessage("Seed"),
    "xmr_available_balance" : MessageLookupByLibrary.simpleMessage("OXEN verfügbares Guthaben"),
    "xmr_full_balance" : MessageLookupByLibrary.simpleMessage("OXEN volles Guthaben"),
    "xmr_hidden" : MessageLookupByLibrary.simpleMessage("Oxen versteckt"),
    "yesterday" : MessageLookupByLibrary.simpleMessage("Gestern"),
    "you_will_get" : MessageLookupByLibrary.simpleMessage("Sie erhalten"),
    "you_will_send" : MessageLookupByLibrary.simpleMessage("Du wirst senden")
  };
}
