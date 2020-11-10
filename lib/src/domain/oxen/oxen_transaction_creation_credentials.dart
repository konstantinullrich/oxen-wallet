import 'package:oxen_wallet/src/domain/common/oxen_transaction_priority.dart';
import 'package:oxen_wallet/src/domain/common/transaction_creation_credentials.dart';

class OxenTransactionCreationCredentials
    extends TransactionCreationCredentials {
  OxenTransactionCreationCredentials(
      {this.address, this.paymentId, this.priority, this.amount});

  final String address;
  final String paymentId;
  final String amount;
  final OxenTransactionPriority priority;
}
