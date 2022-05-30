import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_2/blocs/crypto/crypto_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc_test_2/network/services/rest_client_stats.dart';
import 'package:flutter_bloc_test_2/repositories/crypto_repository.dart';

part 'blocs.dart';

part 'repositories.dart';

part 'providers.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    Key? key,
    required this.child,
  }) : super(key: key);

  /* engages MultiBlocProvider containing bloc providers (_Blocs)
   to MultiRepositoryProvider containing repository providers (_Repositories)
   to MultiProvider containing providers for connectivity, logger etc... */
  @override
  Widget build(BuildContext context) => _Providers(
        child: _Repositories(
          child: _Blocs(
            child: child,
          ),
        ),
      );
}
