part of 'dependency_injector.dart';

class _Blocs extends StatelessWidget {
  final Widget child;

  const _Blocs({
    Key? key,
    required this.child,
  }) : super(key: key);

  // the MultiBlocProvider allows to merge BlocProviders without needing to nest them
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CryptoBloc>(
            create: (context) => CryptoBloc(
              connectivity: context.read(),
              logger: context.read(),
              repository: context.read(),
            ),
          ),
        ],
        child: child,
      );
}
