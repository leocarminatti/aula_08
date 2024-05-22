import 'dart:convert';

import 'package:aula_08/models/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinMarketCapApi {
  Future<List<Coin>> obterInfo() async {
    var client = http.Client();
    try {
      final uri = Uri.parse(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=50&CMC_PRO_API_KEY=e1ea2d63-b403-43ab-922c-0a9c82063ea3',
      );

      var response = await client.get(uri);

      List<Coin> coins = [];

      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            const JsonDecoder().convert(response.body);

        coins =
            json['data'].map<Coin>((value) => Coin.fromJson(value)).toList();
      }

      return coins;
    } catch (e) {
      return [];
    }
  }
}
