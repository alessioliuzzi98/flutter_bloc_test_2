import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker.freezed.dart';

part 'ticker.g.dart';

/// The Crypto ticker model
@freezed
class Ticker with _$Ticker {
  /// The helper factory method to generate the Ticker constructor
  factory Ticker({
    required String id,
    required String symbol,
    required String name,
    required int rank,
    @JsonKey(name: 'percent_change_24h') required String percentChange24h,
  }) = TickerData;

  /// Factory method to generate a Ticker object starting from a json map of string,value
  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);
}
