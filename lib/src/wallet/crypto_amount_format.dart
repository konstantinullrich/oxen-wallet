import 'package:oxen_wallet/generated/l10n.dart';

class AmountDetail {
  const AmountDetail(this.index, this.fraction);

  final int index;
  final int fraction;

  static const List<AmountDetail> all = [
    AmountDetail.ultra,
    AmountDetail.detailed,
    AmountDetail.normal,
    AmountDetail.none
  ];
  static const AmountDetail ultra = AmountDetail(0, 9);
  static const AmountDetail none = AmountDetail(1, 0);
  static const AmountDetail detailed = AmountDetail(2, 4);
  static const AmountDetail normal = AmountDetail(3, 2);

  static AmountDetail deserialize(int index) {
    return all.firstWhere((element) => element.index == index,
        orElse: () => AmountDetail.ultra);
  }

  @override
  String toString() {
    switch (index) {
      case (0):
        return S.current.amount_detail_ultra;
      case (1):
        return S.current.amount_detail_none;
      case (2):
        return S.current.amount_detail_detailed;
      case (3):
        return S.current.amount_detail_normal;
      default:
        return '';
    }
  }
}

double cryptoAmountToDouble({num amount, num divider}) => amount / divider;

int doubleToCryptoAmount({double amount, num divider}) =>
    (amount * divider).toInt();

// Litecoin
const litecoinAmountDivider = 100000000;

double litecoinAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: litecoinAmountDivider);

// Ethereum
const ethereumAmountDivider = 1000000000000000000;

double ethereumAmountToDouble({num amount}) =>
    cryptoAmountToDouble(amount: amount, divider: ethereumAmountDivider);

// Dash
const dashAmountDivider = 100000000;

double dashAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: dashAmountDivider);

// Bitcoin Cash
const bitcoinCashAmountDivider = 100000000;

double bitcoinCashAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: bitcoinCashAmountDivider);

// Bitcoin
const bitcoinAmountDivider = 100000000;

double bitcoinAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: bitcoinAmountDivider);
