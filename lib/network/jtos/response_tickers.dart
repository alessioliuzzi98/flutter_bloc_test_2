import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc_test_2/models/ticker.dart';

part 'response_tickers.freezed.dart';
part 'response_tickers.g.dart';

/// Json Transfer Object to store the response data coming from the rest client
@freezed
class ResponseTickers with _$ResponseTickers {
  /// Helper to generate the constructor for the model Ticker
  factory ResponseTickers({
    @JsonKey(name: 'data') required List<Ticker> list,
  }) = ResponseTickersData;

  /// Method to create a ResponseForecast from a json map of string,dynamic
  factory ResponseTickers.fromJson(Map<String, dynamic> json) =>
      _$ResponseTickersFromJson(json);
}