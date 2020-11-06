import 'dart:convert';

import 'package:loki_wallet/src/domain/common/crypto_currency.dart';
import 'package:loki_wallet/src/domain/common/currency_formatter.dart';
import 'package:loki_wallet/src/domain/common/fiat_currency.dart';
import 'package:http/http.dart';

// TODO: USE COINMARKETCAP-PIPE
const fiatApiAuthority = 'fiat-api.cakewallet.com';
const fiatApiPath = '/v1/rates';

Future<double> fetchPriceFor({CryptoCurrency crypto, FiatCurrency fiat}) async {
  var price = 0.0;

  try {
    final fiatStringified = fiat.toString();
    final uri =
        Uri.https(fiatApiAuthority, fiatApiPath, {'convert': fiatStringified});
    final response = await get(uri.toString());

    if (response.statusCode != 200) {
      return 0.0;
    }

    final responseJSON = json.decode(response.body) as Map<String, dynamic>;
    final data = responseJSON['data'] as List<dynamic>;

    for (final item in data) {
      if (item['symbol'] == cryptoToString(crypto)) {
        price = item['quote'][fiatStringified]['price'] as double;
        break;
      }
    }

    return price;
  } catch (e) {
    return price;
  }
}
