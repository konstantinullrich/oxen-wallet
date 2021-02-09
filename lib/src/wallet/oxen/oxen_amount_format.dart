import 'package:intl/intl.dart';
import 'package:oxen_wallet/src/wallet/crypto_amount_format.dart';

const oxenAmountDivider = 1000000000;

String oxenAmountToString(int amount,
    {AmountDetail detail = AmountDetail.ultra}) {
  final oxenAmountFormat = NumberFormat()
    ..maximumFractionDigits = detail.fraction
    ..minimumFractionDigits = 1;
  return oxenAmountFormat.format(oxenAmountToDouble(amount));
}

double oxenAmountToDouble(int amount) =>
    cryptoAmountToDouble(amount: amount, divider: oxenAmountDivider);
