import 'dart:ffi';

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
  final address = args['address'] as String;
  final amount = args['amount'] as String;

  return stake_native.createStakeSync(address, amount);
}

Future<PendingTransactionDescription> createStake(
        {String address, String amount}) =>
    compute(_createStakeSync, {'address': address, 'amount': amount});
