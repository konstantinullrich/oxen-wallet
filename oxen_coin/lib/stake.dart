import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:oxen_coin/oxen_coin_structs.dart';
import 'package:oxen_coin/src/native/stake.dart' as stake_native;

int countOfTransactions() => stake_native.stakeCountNative();

List<StakeRow> getAllStakes() {
  final size = countOfTransactions();
  final stakePointer = stake_native.stakeGetAllNative();
  final stakeAddresses = stakePointer.asTypedList(size);

  return stakeAddresses
      .map((addr) => Pointer<StakeRow>.fromAddress(addr).ref)
      .toList();
}

PendingTransactionDescription _createStakeSync(Map args) {
  final serviceNodeKey = args['service_node_key'] as String;
  final amount = args['amount'] as String;

  return stake_native.createStakeSync(serviceNodeKey, amount);
}

Future<PendingTransactionDescription> createStake(
        String serviceNodeKey, String amount) =>
    compute(_createStakeSync,
        {'service_node_key': serviceNodeKey, 'amount': amount});

bool canRequestUnstake(String serviceNodeKey) {
  final serviceNodeKeyPointer = serviceNodeKey.toNativeUtf8();
  return stake_native.canRequestUnstakeNative(serviceNodeKeyPointer) != 0;
}

PendingTransactionDescription _submitStakeUnlockSync(Map args) {
  final serviceNodeKey = args['service_node_key'] as String;
  return stake_native.submitStakeUnlockSync(serviceNodeKey);
}

Future<PendingTransactionDescription> submitStakeUnlock(String serviceNodeKey) =>
    compute(_submitStakeUnlockSync, {'service_node_key': serviceNodeKey});
