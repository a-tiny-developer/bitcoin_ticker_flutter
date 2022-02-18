import 'dart:io' show Platform;

import 'package:bitcoin_ticker_flutter/models/models.dart';
import 'package:bitcoin_ticker_flutter/providers/coins_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CoinData.cryptoList.length,
              itemBuilder: (BuildContext context, int index) {
                var cryptoCoin = CoinData.cryptoList[index];
                return FutureBuilder<CoinData>(
                  future:
                      CoinsProvider.getCoinData(cryptoCoin, selectedCurrency),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                            child: Card(
                              color: Colors.indigoAccent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 28,
                                ),
                                child: Text(
                                  '$cryptoCoin = ${snapshot.data!.rate?.toStringAsFixed(2) ?? 'Error'} $selectedCurrency',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                );
              },
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(bottom: 30),
            child: Platform.isIOS
                ? CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedCurrency = CoinData.currenciesList[index];
                      });
                    },
                    children: CoinData.currenciesList
                        .map(
                          (coin) => Text(
                            coin,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                        .toList(),
                  )
                : DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value!;
                      });
                    },
                    value: selectedCurrency,
                    items: CoinData.currenciesList
                        .map((coin) => DropdownMenuItem<String>(
                              child: Text(coin),
                              value: coin,
                            ))
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
