import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:oxen_coin/exceptions/creation_transaction_exception.dart';
import 'package:oxen_coin/oxen_api.dart';
import 'package:oxen_coin/structs/pending_transaction.dart';
import 'package:oxen_coin/structs/stake_row.dart';
import 'package:oxen_coin/structs/ut8_box.dart';
import 'package:oxen_coin/util/signatures.dart';
import 'package:oxen_coin/util/types.dart';

final stakeCountNative = oxenApi
    .lookup<NativeFunction<stake_count>>('stake_count')
    .asFunction<StakeCount>();

final stakeGetAllNative = oxenApi
    .lookup<NativeFunction<stake_get_all>>('stake_get_all')
    .asFunction<StakeGetAll>();

final stakeCreateNative = oxenApi
    .lookup<NativeFunction<stake_create>>('stake_create')
    .asFunction<StakeCreate>();

int countOfTransactions() => stakeCountNative();

List<StakeRow> getAllStakes() {
  final size = stakeCountNative();
  final stakePointer = stakeGetAllNative();
  final stakeAddresses = stakePointer.asTypedList(size);

  return stakeAddresses
      .map((addr) => Pointer<StakeRow>.fromAddress(addr).ref)
      .toList();
}

PendingTransactionDescription createStakeSync(String address, String amount) {
  final addressPointer = Utf8.toUtf8(address);
  final amountPointer = amount != null ? Utf8.toUtf8(amount) : nullptr;
  final errorMessagePointer = allocate<Utf8Box>();
  final pendingTransactionRawPointer = allocate<PendingTransactionRaw>();
  final created = stakeCreateNative(addressPointer, amountPointer,
          errorMessagePointer, pendingTransactionRawPointer) !=
      0;

  free(addressPointer);

  if (amountPointer != nullptr) {
    free(amountPointer);
  }

  if (!created) {
    final message = errorMessagePointer.ref.getValue();
    free(errorMessagePointer);
    throw CreationTransactionException(message: message);
  }

  return PendingTransactionDescription(
      amount: pendingTransactionRawPointer.ref.amount,
      fee: pendingTransactionRawPointer.ref.fee,
      hash: pendingTransactionRawPointer.ref.getHash(),
      pointerAddress: pendingTransactionRawPointer.address);
}

PendingTransactionDescription _createStakeSync(Map args) {
  final address = args['address'] as String;
  final amount = args['amount'] as String;

  return createStakeSync(address, amount);
}

Future<PendingTransactionDescription> createStake(
        {String address, String amount}) =>
    compute(_createStakeSync, {'address': address, 'amount': amount});
