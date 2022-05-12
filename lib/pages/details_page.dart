import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_2/util.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  State<StatefulWidget> createState() => ImageState(index: index);
}

class ImageState extends State<DetailsPage> {
  ImageState({required this.index});

  int index;

  void _onImageTap() {
    setState(() {
      index >= Util.DRINKS_NAME.length - 1 ? index = 0 : index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail page'),
      ),
      body: Center(
        child: _buildHeroDestination(
          Util.DRINKS_URL[index],
          Util.DRINKS_NAME[index],
          width,
        ),
      ),
    );
  }

  Widget _buildHeroDestination(String path, String tag, double width) {
    return Hero(
      tag: tag,
      child: Container(
        width: width,
        child: GestureDetector(
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
          onTap: () => _onImageTap(),
        ),
      ),
    );
  }
}
