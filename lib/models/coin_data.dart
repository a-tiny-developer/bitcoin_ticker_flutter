import 'dart:convert';

class CoinData {
  static const List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];

  static const List<String> cryptoList = [
    'BTC',
    'ETH',
    'LTC',
  ];

  CoinData({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  String? time;
  String? assetIdBase;
  String? assetIdQuote;
  double? rate;

  factory CoinData.fromJson(String str) => CoinData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoinData.fromMap(Map<String, dynamic> json) => CoinData(
        time: json["time"],
        assetIdBase: json["asset_id_base"],
        assetIdQuote: json["asset_id_quote"],
        rate: json["rate"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "asset_id_base": assetIdBase,
        "asset_id_quote": assetIdQuote,
        "rate": rate,
      };
}
