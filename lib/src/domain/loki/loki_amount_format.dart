import 'package:intl/intl.dart';
import 'package:loki_wallet/src/domain/common/crypto_amount_format.dart';

const lokiAmountLength = 12;
const lokiAmountDivider = 1000000000;
final lokiAmountFormat = NumberFormat()
  ..maximumFractionDigits = lokiAmountLength
  ..minimumFractionDigits = 1;

String lokiAmountToString({int amount}) =>
    lokiAmountFormat.format(cryptoAmountToDouble(amount: amount, divider: lokiAmountDivider));

double lokiAmountToDouble({int amount}) => cryptoAmountToDouble(amount: amount, divider: lokiAmountDivider);
