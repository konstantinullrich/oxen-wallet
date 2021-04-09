import 'package:oxen_wallet/src/wallet/transaction/transaction_creation_credentials.dart';

class OxenStakeTransactionCreationCredentials
    extends TransactionCreationCredentials {
  OxenStakeTransactionCreationCredentials({this.address, this.amount});

  final String address;
  final String amount;
}
