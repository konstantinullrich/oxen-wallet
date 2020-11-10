import 'package:oxen_coin/transaction_history.dart';
import 'package:oxen_wallet/src/domain/common/oxen_transaction_priority.dart';
import 'package:oxen_wallet/src/domain/oxen/oxen_amount_format.dart';

// TODO: FIX calculation

double calculateEstimatedFee({OxenTransactionPriority priority}) {
  return oxenAmountToDouble(amount: estimateTransactionFee(priority.raw));
}