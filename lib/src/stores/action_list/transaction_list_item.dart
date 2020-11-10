import 'package:oxen_wallet/src/domain/common/transaction_info.dart';
import 'package:oxen_wallet/src/stores/action_list/action_list_item.dart';

class TransactionListItem extends ActionListItem {
  TransactionListItem({this.transaction});

  final TransactionInfo transaction;

  @override
  DateTime get date => transaction.date;
}