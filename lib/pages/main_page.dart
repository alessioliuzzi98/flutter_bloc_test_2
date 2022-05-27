import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_2/blocs/crypto/crypto_bloc.dart';
import 'package:flutter_bloc_test_2/models/ticker.dart';

class MainPage extends StatelessWidget {
  /// The MainPage constructor
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() => BlocBuilder<CryptoBloc, CryptoState>(
        //buildWhen: (_, current) => current is! FetchedCryptoState,
        builder: (context, state) {
          if (state is LoadingCryptoState) {
            return _loader();
          } else if (state is FetchedCryptoState) {
            return _list(state.tickers.list);
          } else {
            return _error();
          }
        },
      );

  Widget _list(List<Ticker> list) => ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(list[index].symbol),
          subtitle: Text('${list[index].percentChange24h} 24 hour change percentage'),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length,
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
