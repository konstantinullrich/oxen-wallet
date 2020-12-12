import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:oxen_coin/oxen_api.dart';
import 'package:oxen_coin/structs/account_row.dart';
import 'package:oxen_coin/util/signatures.dart';
import 'package:oxen_coin/util/types.dart';

final accountSizeNative = oxenApi
    .lookup<NativeFunction<account_size>>('account_size')
    .asFunction<SubaddressSize>();

final accountRefreshNative = oxenApi
    .lookup<NativeFunction<account_refresh>>('account_refresh')
    .asFunction<AccountRefresh>();

final accountGetAllNative = oxenApi
    .lookup<NativeFunction<account_get_all>>('account_get_all')
    .asFunction<AccountGetAll>();

final accountAddNewNative = oxenApi
    .lookup<NativeFunction<account_add_new>>('account_add_row')
    .asFunction<AccountAddNew>();

final accountSetLabelNative = oxenApi
    .lookup<NativeFunction<account_set_label>>('account_set_label_row')
    .asFunction<AccountSetLabel>();

void refreshAccounts() => accountRefreshNative();

List<AccountRow> getAllAccount() {
  final size = accountSizeNative();
  final accountAddressesPointer = accountGetAllNative();
  final accountAddresses = accountAddressesPointer.asTypedList(size);

  return accountAddresses
      .map((addr) => Pointer<AccountRow>.fromAddress(addr).ref)
      .toList();
}

void addAccountSync({String label}) {
  final labelPointer = Utf8.toUtf8(label);
  accountAddNewNative(labelPointer);
  free(labelPointer);
}

void setLabelForAccountSync({int accountIndex, String label}) {
  final labelPointer = Utf8.toUtf8(label);
  accountSetLabelNative(accountIndex, labelPointer);
  free(labelPointer);
}

void _addAccount(String label) => addAccountSync(label: label);

void _setLabelForAccount(Map<String, dynamic> args) {
  final label = args['label'] as String;
  final accountIndex = args['accountIndex'] as int;

  setLabelForAccountSync(label: label, accountIndex: accountIndex);
}

Future<void> addAccount({String label}) async => compute(_addAccount, label);

Future<void> setLabelForAccount({int accountIndex, String label}) async =>
    compute(
        _setLabelForAccount, {'accountIndex': accountIndex, 'label': label});
