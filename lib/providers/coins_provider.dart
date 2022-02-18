import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class CoinsProvider {
  static const _apiKey = 'API_KEY';
  static const _baseURl = 'rest.coinapi.io';
  static const unencodedPath = 'v1/exchangerate';
  static const _headers = {
    'X-CoinAPI-Key': _apiKey,
  };

  static Future<CoinData> getCoinData(
      String cryptoCoin, String normalCoin) async {
    final url = Uri.https(_baseURl, '$unencodedPath/$cryptoCoin/$normalCoin');
    final response = await http.get(url, headers: _headers);
    final coinResponse = CoinData.fromJson(response.body);
    return coinResponse;
  }
}
