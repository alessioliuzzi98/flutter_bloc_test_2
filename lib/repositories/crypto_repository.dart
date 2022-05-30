import 'package:dio/dio.dart';
import 'package:flutter_bloc_test_2/errors/generic_exception.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:flutter_bloc_test_2/network/services/rest_client_images.dart';
import 'package:flutter_bloc_test_2/network/services/rest_client_stats.dart';

/// The crypto repository used to retrieve the crypto list
class CryptoRepository {
  /// The restclient to gather the tickers from the network layer
  final RestClientStats restClientStats;

  /// The restclient to gather the tickers from the network layer
  final RestClientImages restClientImage;

  /// The CryptoRepository constructor
  CryptoRepository(
      {required this.restClientStats, required this.restClientImage});

  /// The method to retrieve the list of crypto
  Future<ResponseTickers> list() async {
    ResponseTickers? response;

    try {
      response = await restClientStats.tickerList();
      response.list.forEach((ticker) {
        //ticker.imageUrl = await
      });
    } on DioError catch (error) {
      switch (error.response?.statusCode) {
      // TODO: manage the various exceptions
        default:
          throw GenericException();
      }
    }

    return response;
  }
}
