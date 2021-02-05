import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:oxen_coin/oxen_api.dart';
import 'package:oxen_coin/structs/subaddress_row.dart';
import 'package:oxen_coin/util/signatures.dart';
import 'package:oxen_coin/util/types.dart';

final subaddressSizeNative = oxenApi
    .lookup<NativeFunction<subaddress_size>>('subaddress_size')
    .asFunction<SubaddressSize>();

final subaddressRefreshNative = oxenApi
    .lookup<NativeFunction<subaddress_refresh>>('subaddress_refresh')
    .asFunction<SubaddressRefresh>();

final subaddressGetAllNative = oxenApi
    .lookup<NativeFunction<subaddress_get_all>>('subaddress_get_all')
    .asFunction<SubaddressGetAll>();

final subaddressAddNewNative = oxenApi
    .lookup<NativeFunction<subaddress_add_new>>('subaddress_add_row')
    .asFunction<SubaddressAddNew>();

final subaddressSetLabelNative = oxenApi
    .lookup<NativeFunction<subaddress_set_label>>('subaddress_set_label')
    .asFunction<SubaddressSetLabel>();

void refreshSubaddresses({int accountIndex}) =>
    subaddressRefreshNative(accountIndex);

List<SubaddressRow> getAllSubaddresses() {
  final size = subaddressSizeNative();
  final subaddressAddressesPointer = subaddressGetAllNative();
  final subaddressAddresses = subaddressAddressesPointer.asTypedList(size);

  return subaddressAddresses
      .map((addr) => Pointer<SubaddressRow>.fromAddress(addr).ref)
      .toList();
}

void addSubaddressSync({int accountIndex, String label}) {
  final labelPointer = Utf8.toUtf8(label);
  subaddressAddNewNative(accountIndex, labelPointer);
  free(labelPointer);
}

void setLabelForSubaddressSync(
    {int accountIndex, int addressIndex, String label}) {
  final labelPointer = Utf8.toUtf8(label);

  subaddressSetLabelNative(accountIndex, addressIndex, labelPointer);
  free(labelPointer);
}

void _addSubaddress(Map<String, dynamic> args) {
  final label = args['label'] as String;
  final accountIndex = args['accountIndex'] as int;

  addSubaddressSync(accountIndex: accountIndex, label: label);
}

void _setLabelForSubaddress(Map<String, dynamic> args) {
  final label = args['label'] as String;
  final accountIndex = args['accountIndex'] as int;
  final addressIndex = args['addressIndex'] as int;

  setLabelForSubaddressSync(
      accountIndex: accountIndex, addressIndex: addressIndex, label: label);
}

Future addSubaddress({int accountIndex, String label}) async =>
    compute<Map<String, Object>, void>(
        _addSubaddress, {'accountIndex': accountIndex, 'label': label});

Future setLabelForSubaddress(
        {int accountIndex, int addressIndex, String label}) =>
    compute<Map<String, Object>, void>(_setLabelForSubaddress, {
      'accountIndex': accountIndex,
      'addressIndex': addressIndex,
      'label': label
    });
