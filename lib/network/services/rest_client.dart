import 'package:dio/dio.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// The Rest Client API service to gather crypto informations
@RestApi(baseUrl: '${RestClient.baseUrl}/api/')
abstract class RestClient {
  /// The API baseUrl
  static const String baseUrl =
      'https://coinlore-cryptocurrency.p.rapidapi.com';

  /// The API host
  static const String apiHost = 'coinlore-cryptocurrency.p.rapidapi.com';

  /// The API key
  static const String apiKey = ''; // TODO: set your own RapidApi apiKey

  /// Helper factory to generate the RestClient constructor
  factory RestClient(Dio dio) => _RestClient(dio);

  /// The method to gather crypto tickers from the API servers
  @GET('/tickers/?start=0&limit=50')
  Future<ResponseTickers> tickerList({
    @Header('X-RapidAPI-Host') String apiHost = RestClient.apiHost,
    @Header('X-RapidAPI-Key') String apiKey = RestClient.apiKey,
  });
}
