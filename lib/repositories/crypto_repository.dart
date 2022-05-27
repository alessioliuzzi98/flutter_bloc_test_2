import 'package:dio/dio.dart';
import 'package:flutter_bloc_test_2/errors/generic_exception.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:flutter_bloc_test_2/network/services/rest_client.dart';

/// The crypto repository used to retrieve the crypto list
class CryptoRepository {
  /// The restclient to gather the weather from the network layer
  final RestClient restClient;

  /// The CryptoRepository constructor
  CryptoRepository({required this.restClient});

  /// The method to retrieve the list of crypto
  Future<ResponseTickers> list() async {
    ResponseTickers? response;

    try {
      response = await restClient.tickerList();
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
