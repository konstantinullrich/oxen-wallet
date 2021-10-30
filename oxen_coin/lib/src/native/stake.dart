import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:oxen_coin/oxen_coin_structs.dart';
import 'package:oxen_coin/src/exceptions/creation_transaction_exception.dart';
import 'package:oxen_coin/src/oxen_api.dart';
import 'package:oxen_coin/src/structs/ut8_box.dart';
import 'package:oxen_coin/src/util/signatures.dart';
import 'package:oxen_coin/src/util/types.dart';

final stakeCountNative = oxenApi
    .lookup<NativeFunction<stake_count>>('stake_count')
    .asFunction<StakeCount>();

final stakeGetAllNative = oxenApi
    .lookup<NativeFunction<stake_get_all>>('stake_get_all')
    .asFunction<StakeGetAll>();

final stakeCreateNative = oxenApi
    .lookup<NativeFunction<stake_create>>('stake_create')
    .asFunction<StakeCreate>();

final canRequestUnstakeNative = oxenApi
    .lookup<NativeFunction<can_request_unstake>>('can_request_stake_unlock')
    .asFunction<CanRequestUnstake>();

final submitStakeUnlockNative = oxenApi
    .lookup<NativeFunction<submit_stake_unlock>>('submit_stake_unlock')
    .asFunction<SubmitStakeUnlock>();

PendingTransactionDescription createStakeSync(
    String serviceNodeKey, String amount) {
  final serviceNodeKeyPointer = serviceNodeKey.toNativeUtf8();
  final amountPointer = amount != null ? amount.toNativeUtf8() : nullptr;
  final errorMessagePointer = calloc.allocate<Utf8Box>(255);
  final pendingTransactionRawPointer = calloc.allocate<PendingTransactionRaw>(20000);
  final created = stakeCreateNative(serviceNodeKeyPointer, amountPointer,
          errorMessagePointer, pendingTransactionRawPointer) !=
      0;

  calloc.free(serviceNodeKeyPointer);

  if (amountPointer != nullptr) {
    calloc.free(amountPointer);
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

PendingTransactionDescription submitStakeUnlockSync(String serviceNodeKey) {
  final serviceNodeKeyPointer = Utf8.toUtf8(serviceNodeKey);
  final errorMessagePointer = allocate<Utf8Box>();
  final pendingTransactionRawPointer = allocate<PendingTransactionRaw>();
  final created = submitStakeUnlockNative(serviceNodeKeyPointer,
          errorMessagePointer, pendingTransactionRawPointer) !=
      0;

  free(serviceNodeKeyPointer);

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
