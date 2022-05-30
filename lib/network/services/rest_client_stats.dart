import 'package:dio/dio.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_stats.g.dart';

/// The Rest Client API service to gather crypto informations
@RestApi(baseUrl: RestClientStats.baseUrl)
abstract class RestClientStats {
  /// The API baseUrl
  static const String baseUrl =
      'https://coinlore-cryptocurrency.p.rapidapi.com/api/';

  /// The API host
  static const String apiHost = 'coinlore-cryptocurrency.p.rapidapi.com';

  /// The API key
  static const String apiKey = 'c781949117msh2cc955fffa1f24ep1d0caajsn46bc08995552'; // TODO: set your own RapidApi apiKey

  /// Helper factory to generate the RestClient constructor
  factory RestClientStats(Dio dio) => _RestClientStats(dio);

  /// The method to gather crypto tickers from the API servers
  @GET('/tickers/?start=0&limit=10')
  Future<ResponseTickers> tickerList({
    @Header('X-RapidAPI-Host') String apiHost = RestClientStats.apiHost,
    @Header('X-RapidAPI-Key') String apiKey = RestClientStats.apiKey,
  });
}
