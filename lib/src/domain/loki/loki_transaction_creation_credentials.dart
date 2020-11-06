import 'package:loki_wallet/src/domain/common/loki_transaction_priority.dart';
import 'package:loki_wallet/src/domain/common/transaction_creation_credentials.dart';

class LokiTransactionCreationCredentials
    extends TransactionCreationCredentials {
  LokiTransactionCreationCredentials(
      {this.address, this.paymentId, this.priority, this.amount});

  final String address;
  final String paymentId;
  final String amount;
  final LokiTransactionPriority priority;
}
