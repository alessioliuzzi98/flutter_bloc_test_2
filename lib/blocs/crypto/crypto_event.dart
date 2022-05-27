part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();
}

class FetchCryptoEvent extends CryptoEvent {
  @override
  List<Object?> get props => [];
}
