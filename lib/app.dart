import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class BitcoinTicker extends StatelessWidget {
  const BitcoinTicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BitcoinTicker",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.priceScreen,
      routes: AppRoutes.getAppRoutes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
