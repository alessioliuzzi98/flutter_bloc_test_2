part of 'dependency_injector.dart';

class _Repositories extends StatelessWidget {
  final Widget child;

  const _Repositories({
    Key? key,
    required this.child,
  }) : super(key: key);

  // the MultiRepositoryProvider allows to merge RepositoryProvider without needing to nest them
  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<MainRepository>(
            create: (context) => MainRepository(),
          ),
          // TODO: add here your repositories with RepositoryProvider
        ],
        child: child,
      );
}
