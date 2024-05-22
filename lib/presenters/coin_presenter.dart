import 'package:aula_08/apis/coin_market_cap_api.dart';
import 'package:aula_08/models/coin_model.dart';
import 'package:flutter/material.dart';

class CoinPresenter extends ChangeNotifier {
  CoinMarketCapApi api;
  List<Coin> coins = [];

  CoinPresenter(this.api);

  void obertInfo() async {
    coins = await api.obterInfo();
    notifyListeners();
  }
}
