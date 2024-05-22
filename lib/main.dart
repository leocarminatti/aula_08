import 'package:aula_08/apis/coin_market_cap_api.dart';
import 'package:aula_08/coins_list_page.dart';
import 'package:aula_08/presenters/coin_presenter.dart';
import 'package:aula_08/presenters/text_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CoinPresenter(CoinMarketCapApi()),
          ),
          ChangeNotifierProvider(
            create: (context) => TextPresenter(),
          ),
        ],
        child: CoinsListPage(),
      ),
    );
  }
}
