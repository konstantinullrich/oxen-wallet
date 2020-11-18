import 'dart:convert';

import 'package:oxen_wallet/src/domain/common/crypto_currency.dart';
import 'package:oxen_wallet/src/domain/common/fiat_currency.dart';
import 'package:http/http.dart';

// TODO: USE COINMARKETCAP-PIPE
const fiatApiAuthority = 'crypto.konstantinullrich.de';
const fiatApiPath = '/v1/rates';

Future<double> fetchPriceFor({CryptoCurrency crypto, FiatCurrency fiat}) async {
  var price = 0.0;

  try {
    final fiatStringed = fiat.toString();
    final cryptoStringed = crypto.toString();

    final apiPath = '/api/price/$fiatStringed/$cryptoStringed';
    final uri = Uri.https(fiatApiAuthority, apiPath);
    final response = await get(uri.toString());

    print(response.statusCode);

    if (response.statusCode != 200) {
      return 0.0;
    }

    final responseJSON = json.decode(response.body) as Map<String, dynamic>;
    print(responseJSON);

    if (responseJSON.containsKey(fiatStringed.toLowerCase())) {
      price = responseJSON[fiatStringed.toLowerCase()] as double;
      print(price);
    }

    return price;
  } catch (e) {
    return price;
  }
}
