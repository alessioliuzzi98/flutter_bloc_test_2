import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_2/blocs/crypto/crypto_bloc.dart';
import 'package:flutter_bloc_test_2/models/ticker.dart';
import 'package:flutter_bloc_test_2/routers/app_router.gr.dart';

class MainPage extends StatelessWidget {
  /// The MainPage constructor
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto list'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => BlocBuilder<CryptoBloc, CryptoState>(
        bloc: context.read<CryptoBloc>()..loadData(),
        builder: (context, state) {
          if (state is LoadingCryptoState) {
            return _loader();
          } else if (state is FetchedCryptoState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    'Markets',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Expanded(
                  child: _list(state.tickers.list),
                ),
              ],
            );
          } else {
            return _error();
          }
        },
      );

  Widget _list(List<Ticker> list) => ListView.separated(
        itemBuilder: (context, index) => _item(context, list[index]),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length,
      );

  Widget _item(BuildContext context, Ticker ticker) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => context.router.push(
          DetailsRoute(
            ticker: ticker,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 10,
          ),
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ticker.imageUrl != null
                  ? Image.network(ticker.imageUrl!)
                  : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ticker.symbol),
                  Text(ticker.name),
                ],
              ),
              Expanded(
                child: double.parse(ticker.percentChange24h).isNegative
                    ? const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${ticker.priceUsd} \$'),
                  Text(
                    '${ticker.percentChange24h}%',
                    style: TextStyle(
                      color: double.parse(ticker.percentChange24h).isNegative
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _loader() => Center(
        child: Container(
          height: 150,
          width: 150,
          child: const CircularProgressIndicator(),
        ),
      );

  Widget _error() => const Center(
        child: Text(
          'There was an error. Try later',
        ),
      );
}
