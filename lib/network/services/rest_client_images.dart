import 'package:dio/dio.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_images.g.dart';

/// The Rest Client API service to gather crypto images
@RestApi(baseUrl: RestClientImages.baseUrl)
abstract class RestClientImages {
  /// The API baseUrl
  static const String baseUrl = 'https://crypto-icon.p.rapidapi.com';

  /// The API host
  static const String apiHost = 'crypto-icon.p.rapidapi.com';

  /// The API key
  static const String apiKey =
      'c781949117msh2cc955fffa1f24ep1d0caajsn46bc08995552'; // TODO: set your own RapidApi apiKey

  /// Helper factory to generate the RestClientImages constructor
  factory RestClientImages(Dio dio) => RestClientImages(dio);

  /// The method to gather crypto image from the API servers
  @GET('/get-icon/')
  Future<String> getIcon({
    @Header('X-RapidAPI-Host') String apiHost = RestClientImages.apiHost,
    @Header('X-RapidAPI-Key') String apiKey = RestClientImages.apiKey,
    @Query('') String? symbol,
  });
}
