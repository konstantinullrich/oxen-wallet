import 'dart:ffi';
import 'package:oxen_coin/structs/ut8_box.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:oxen_coin/signatures.dart';
import 'package:oxen_coin/types.dart';
import 'package:oxen_coin/oxen_api.dart';
import 'package:oxen_coin/structs/transaction_info_row.dart';
import 'package:oxen_coin/structs/pending_transaction.dart';
import 'package:oxen_coin/exceptions/creation_transaction_exception.dart';

final transactionsRefreshNative = oxenApi
    .lookup<NativeFunction<transactions_refresh>>('transactions_refresh')
    .asFunction<TransactionsRefresh>();

final transactionsCountNative = oxenApi
    .lookup<NativeFunction<transactions_count>>('transactions_count')
    .asFunction<TransactionsCount>();

final transactionsGetAllNative = oxenApi
    .lookup<NativeFunction<transactions_get_all>>('transactions_get_all')
    .asFunction<TransactionsGetAll>();

final transactionCreateNative = oxenApi
    .lookup<NativeFunction<transaction_create>>('transaction_create')
    .asFunction<TransactionCreate>();

final transactionCommitNative = oxenApi
    .lookup<NativeFunction<transaction_commit>>('transaction_commit')
    .asFunction<TransactionCommit>();

final transactionEstimateFeeNative = oxenApi
    .lookup<NativeFunction<transaction_estimate_fee>>('transaction_estimate_fee')
    .asFunction<TransactionEstimateFee>();

void refreshTransactions() => transactionsRefreshNative();

int countOfTransactions() => transactionsCountNative();

int estimateTransactionFee(int priorityRaw, {int recipients = 1}) =>
    transactionEstimateFeeNative(priorityRaw, recipients);

List<TransactionInfoRow> getAllTransactions() {
  final size = transactionsCountNative();
  final transactionsPointer = transactionsGetAllNative();
  final transactionsAddresses = transactionsPointer.asTypedList(size);

  return transactionsAddresses
      .map((addr) => Pointer<TransactionInfoRow>.fromAddress(addr).ref)
      .toList();
}

PendingTransactionDescription createTransactionSync(
    {String address,
    String amount,
    int priorityRaw,
    int accountIndex = 0}) {
  final addressPointer = Utf8.toUtf8(address);
  final amountPointer = amount != null ? Utf8.toUtf8(amount) : nullptr;
  final errorMessagePointer = allocate<Utf8Box>();
  final pendingTransactionRawPointer = allocate<PendingTransactionRaw>();
  final created = transactionCreateNative(
          addressPointer,
          amountPointer,
          priorityRaw,
          accountIndex,
          errorMessagePointer,
          pendingTransactionRawPointer) !=
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

void commitTransactionFromPointerAddress({int address}) => commitTransaction(
    transactionPointer: Pointer<PendingTransactionRaw>.fromAddress(address));

void commitTransaction({Pointer<PendingTransactionRaw> transactionPointer}) {
  final errorMessagePointer = allocate<Utf8Box>();
  final isCommited =
      transactionCommitNative(transactionPointer, errorMessagePointer) != 0;

  if (!isCommited) {
    final message = errorMessagePointer.ref.getValue();
    free(errorMessagePointer);
    throw CreationTransactionException(message: message);
  }
}

PendingTransactionDescription _createTransactionSync(Map args) {
  final address = args['address'] as String;
  final amount = args['amount'] as String;
  final priorityRaw = args['priorityRaw'] as int;
  final accountIndex = args['accountIndex'] as int;

  return createTransactionSync(
      address: address,
      amount: amount,
      priorityRaw: priorityRaw,
      accountIndex: accountIndex);
}

Future<PendingTransactionDescription> createTransaction(
        {String address,
        String amount,
        int priorityRaw,
        int accountIndex = 0}) =>
    compute(_createTransactionSync, {
      'address': address,
      'amount': amount,
      'priorityRaw': priorityRaw,
      'accountIndex': accountIndex
    });
