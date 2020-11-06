import 'package:loki_wallet/generated/i18n.dart';
import 'package:loki_wallet/src/domain/common/enumerable_item.dart';

class MoneroTransactionPriority extends EnumerableItem<int> with Serializable<int> {
  const MoneroTransactionPriority({String title, int raw})
      : super(title: title, raw: raw);

  static const all = [
    MoneroTransactionPriority.slow,
    MoneroTransactionPriority.regular,
    MoneroTransactionPriority.medium,
    MoneroTransactionPriority.fast,
    MoneroTransactionPriority.fastest
  ];
  static const slow = MoneroTransactionPriority(title: 'Slow', raw: 0);
  static const regular = MoneroTransactionPriority(title: 'Regular', raw: 1);
  static const medium = MoneroTransactionPriority(title: 'Medium', raw: 2);
  static const fast = MoneroTransactionPriority(title: 'Fast', raw: 3);
  static const fastest = MoneroTransactionPriority(title: 'Fastest', raw: 4);
  static const standart = slow;

  static MoneroTransactionPriority deserialize({int raw}) {
    switch (raw) {
      case 0:
        return slow;
      case 1:
        return regular;
      case 2:
        return medium;
      case 3:
        return fast;
      case 4:
        return fastest;
      default:
        return null;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MoneroTransactionPriority.slow:
        return S.current.transaction_priority_slow;
      case MoneroTransactionPriority.regular:
        return S.current.transaction_priority_regular;
      case MoneroTransactionPriority.medium:
        return S.current.transaction_priority_medium;
      case MoneroTransactionPriority.fast:
        return S.current.transaction_priority_fast;
      case MoneroTransactionPriority.fastest:
        return S.current.transaction_priority_fastest;
      default:
        return '';
    }
  }
}
