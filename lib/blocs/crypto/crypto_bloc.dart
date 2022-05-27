import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test_2/errors/generic_exception.dart';
import 'package:flutter_bloc_test_2/network/jtos/response_tickers.dart';
import 'package:flutter_bloc_test_2/repositories/crypto_repository.dart';
import 'package:logger/logger.dart';
import 'package:flutter_bloc_test_2/models/ticker.dart';

part 'crypto_event.dart';

part 'crypto_state.dart';

/// The crypto BLoC component to fetch crypto data and emit the proper state accordingly
class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  /// The weather repository
  final CryptoRepository repository;

  /// The connectivity service
  final Connectivity connectivity;

  /// The logger service
  final Logger logger;

  CryptoBloc({
    required this.repository,
    required this.connectivity,
    required this.logger,
  }) : super(LoadingCryptoState()) {
    on<CryptoEvent>(_mapFetchCryptoEventToState);
  }

  void _mapFetchCryptoEventToState(
      CryptoEvent event, Emitter<CryptoState> emit) async {

    if ((await (connectivity.checkConnectivity())) !=
        ConnectivityResult.none) {
      emit(LoadingCryptoState());

      ResponseTickers? tickers;
      try {
        logger.d('Fetching cryptos');
        tickers = await repository.list();
      } on GenericException catch (error) {
        // TODO: manage error and emit to state
        logger.e('Cannot fetch cryptos');
        emit(ErrorCryptoState());
      } finally {
        logger.d('Fetched cryptos');
        if (tickers != null) {
          emit(FetchedCryptoState(tickers));
        }
      }
    } else {
      // TODO: manage different types of error (in this case is internet not available)

      logger.e('Internet is not available');
      emit(ErrorCryptoState());
    }
  }

  void loadData() {
    add(FetchCryptoEvent());
  }
}
