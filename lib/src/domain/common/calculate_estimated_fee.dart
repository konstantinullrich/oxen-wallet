import 'package:loki_wallet/src/domain/common/loki_transaction_priority.dart';

// TODO: FIX calculation

double calculateEstimatedFee({LokiTransactionPriority priority}) {
  if (priority == LokiTransactionPriority.slow) {
    return 0.00002459;
  }

  if (priority == LokiTransactionPriority.blink) {
    return 0.0260216;
  }

  return 0;
}