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
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
          // TODO: add here your blocs and cubits with BlocProvider
        ],
        child: child,
      );
}
