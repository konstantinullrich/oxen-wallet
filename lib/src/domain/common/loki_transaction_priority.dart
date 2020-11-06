import 'package:loki_wallet/generated/i18n.dart';
import 'package:loki_wallet/src/domain/common/enumerable_item.dart';

class LokiTransactionPriority extends EnumerableItem<int> with Serializable<int> {
  const LokiTransactionPriority({String title, int raw})
      : super(title: title, raw: raw);

  static const all = [
    LokiTransactionPriority.slow,
    LokiTransactionPriority.blink
  ];

  static const slow = LokiTransactionPriority(title: 'Slow', raw: 1);
  static const blink = LokiTransactionPriority(title: 'Blink', raw: 5);
  static const standard = slow;

  static LokiTransactionPriority deserialize({int raw}) {
    switch (raw) {
      case 1:
        return slow;
      case 5:
        return blink;
      default:
        return null;
    }
  }

  @override
  String toString() {
    switch (this) {
      case LokiTransactionPriority.slow:
        return S.current.transaction_priority_slow;
      case LokiTransactionPriority.blink:
        return S.current.transaction_priority_fastest; // TODO: ADD BLINK
      default:
        return '';
    }
  }
}
