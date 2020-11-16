import 'package:oxen_wallet/generated/i18n.dart';
import 'package:oxen_wallet/src/domain/common/enumerable_item.dart';

class OxenTransactionPriority extends EnumerableItem<int> with Serializable<int> {
  const OxenTransactionPriority({String title, int raw})
      : super(title: title, raw: raw);

  static const all = [
    OxenTransactionPriority.slow,
    OxenTransactionPriority.blink
  ];

  static const slow = OxenTransactionPriority(title: 'Slow', raw: 1);
  static const blink = OxenTransactionPriority(title: 'Blink', raw: 5);
  static const standard = blink;

  static OxenTransactionPriority deserialize({int raw}) {
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
      case OxenTransactionPriority.slow:
        return S.current.transaction_priority_slow;
      case OxenTransactionPriority.blink:
        return S.current.transaction_priority_blink;
      default:
        return '';
    }
  }
}
