import 'package:loki_wallet/src/domain/common/crypto_currency.dart';

String cryptoToString(CryptoCurrency crypto) {
  switch (crypto) {
    case CryptoCurrency.xmr:
      return 'XMR';
    default:
      return '';
  }
}