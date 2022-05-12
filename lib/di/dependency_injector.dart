import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_2/blocs/main/main_bloc.dart';
import 'package:flutter_bloc_test_2/repositories/main_repository.dart';

part 'blocs.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    Key? key,
    required this.child,
  }) : super(key: key);

  // engages MultiBlocProvider containing blocs (_Blocs) to MultiRepositoryProvider containing providers (_Repositories)
  @override
  Widget build(BuildContext context) => _Repositories(
        child: _Blocs(
          child: child,
        ),
      );
}
