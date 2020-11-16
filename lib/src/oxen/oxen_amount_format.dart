import 'package:intl/intl.dart';
import 'package:oxen_wallet/src/domain/crypto_amount_format.dart';

const oxenAmountLength = 12;
const oxenAmountDivider = 1000000000;
final oxenAmountFormat = NumberFormat()
  ..maximumFractionDigits = oxenAmountLength
  ..minimumFractionDigits = 1;

String oxenAmountToString({int amount}) =>
    oxenAmountFormat.format(cryptoAmountToDouble(amount: amount, divider: oxenAmountDivider));

double oxenAmountToDouble({int amount}) => cryptoAmountToDouble(amount: amount, divider: oxenAmountDivider);
