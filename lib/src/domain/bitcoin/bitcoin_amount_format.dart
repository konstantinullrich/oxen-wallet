import 'package:oxen_wallet/src/domain/common/crypto_amount_format.dart';

const bitcoinAmountDivider = 100000000;

double bitcoinAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: bitcoinAmountDivider);