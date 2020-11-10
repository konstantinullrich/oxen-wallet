import 'package:oxen_wallet/src/domain/common/oxen_transaction_priority.dart';

// TODO: FIX calculation

double calculateEstimatedFee({OxenTransactionPriority priority}) {
  if (priority == OxenTransactionPriority.slow) {
    // 2*<fee_per_output> + size*<fee_per_byte>
    return 0.00002459;
  }

  if (priority == OxenTransactionPriority.blink) {
    // 2*<blink_fee_per_output> + size*<blink_fee_per_byte>
    return 0.0260216;
  }

  return 0;
}