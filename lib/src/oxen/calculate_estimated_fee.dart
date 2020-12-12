import 'package:oxen_coin/transaction_history.dart';
import 'package:oxen_wallet/src/oxen/oxen_amount_format.dart';
import 'package:oxen_wallet/src/oxen/transaction_priority.dart';

double calculateEstimatedFee({OxenTransactionPriority priority}) {
  return oxenAmountToDouble(amount: estimateTransactionFee(priority.raw));
}
