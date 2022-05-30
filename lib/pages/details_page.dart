import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_2/models/ticker.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.ticker}) : super(key: key);

  Ticker ticker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ticker.symbol,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.red),
          ),
          const Divider(
            height: 20,
          ),
          Text('Rank'),
          Text('${ticker.rank}'),
          const Divider(
            height: 20,
          ),
          Text("24h% change"),
          Text(ticker.percentChange24h),
          const Divider(
            height: 20,
          ),
        ],
      ),
    );
  }
}
