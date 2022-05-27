part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
}

class LoadingCryptoState extends CryptoState {
  @override
  List<Object> get props => [];
}

class FetchedCryptoState extends CryptoState {
  FetchedCryptoState(this.tickers);

  ResponseTickers tickers;

  @override
  List<Object> get props => [tickers];
}

class ErrorCryptoState extends CryptoState {
  @override
  List<Object?> get props => [];
}
