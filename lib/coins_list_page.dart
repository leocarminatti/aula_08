import 'package:aula_08/presenters/coin_presenter.dart';
import 'package:aula_08/presenters/text_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinsListPage extends StatelessWidget {
  CoinsListPage({super.key});

  late CoinPresenter presenter;

  @override
  Widget build(BuildContext context) {
    presenter = context.read<CoinPresenter>()..obertInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Cryptos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                onChanged: (value) {
                  context.read<TextPresenter>().changeText(value);
                },
              ),
            ),
            Consumer<TextPresenter>(
              builder: (_, tp, widget) {
                return Text(
                  tp.text,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Expanded(
              child: Consumer<CoinPresenter>(builder: (_, cp, widget) {
                final coins = cp.coins;

                if (coins.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(coins[index].name ?? ''),
                    subtitle: Text(coins[index].symbol ?? ''),
                    trailing: Text(coins[index].slug ?? ''),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
