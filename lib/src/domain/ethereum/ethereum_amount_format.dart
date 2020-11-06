import 'package:loki_wallet/src/domain/common/crypto_amount_format.dart';

const ethereumAmountDivider = 1000000000000000000;

double ethereumAmountToDouble({num amount}) =>
    cryptoAmountToDouble(amount: amount, divider: ethereumAmountDivider);