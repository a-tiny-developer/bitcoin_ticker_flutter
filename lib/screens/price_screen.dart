import 'package:bitcoin_ticker_flutter/models/models.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 28,
                ),
                child: Text(
                  '1 BTC  = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(bottom: 30),
            child: DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
              value: selectedCurrency,
              items: CoinData.currenciesList
                  .map(
                    (coin) => DropdownMenuItem<String>(
                      child: Text(coin),
                      value: coin,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
