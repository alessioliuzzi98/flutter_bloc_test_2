import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_2/pages/details_page.dart';
import 'package:flutter_bloc_test_2/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.hello_world ?? ''),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _buildHeroIcon(context, Util.CHOCOLATE_URL, Util.CHOCOLATE_NAME),
              onTap: () {
                _changeRoute(context, Util.CHOCOLATE_NAME);
              },
            ),
            GestureDetector(
              child: _buildHeroIcon(context, Util.COFFEE_URL, Util.COFFEE_NAME),
              onTap: () {
                _changeRoute(context, Util.COFFEE_NAME);
              },
            ),
            GestureDetector(
              child: _buildHeroIcon(context, Util.TEA_URL, Util.TEA_NAME),
              onTap: () {
                _changeRoute(context, Util.TEA_NAME);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroIcon(BuildContext context, String path, String tag) {
    double height = MediaQuery.of(context).size.height / 8;

    return Hero(
      tag: tag,
      child: SizedBox(
        height: height,
        width: height,
        child: Image.network(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _changeRoute(BuildContext context, String drink) {
    switch (drink) {
      case Util.COFFEE_NAME:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(index: 0),
          ),
        );
        break;
      case Util.CHOCOLATE_NAME:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(index: 1),
          ),
        );
        break;
      case Util.TEA_NAME:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(index: 2),
          ),
        );
        break;
    }
  }
}
