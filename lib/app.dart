import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_2/di/dependency_injector.dart';
import 'package:flutter_bloc_test_2/routers/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp.router(
        // disable the debug label on app
        debugShowCheckedModeBanner: false,
        // a delegate that is used by the Router widget to parse a route information into a configuration
        routeInformationParser: _router.defaultRouteParser(),
        // a delegate that is used by the Router widget to build and configure a navigating widget
        routerDelegate: _router.delegate(),
        title: "Crypto test app",
        theme: ThemeData(
          // sets the primary color
          primaryColor: Colors.amber,
          // sets the dark mode automatically
          brightness: Brightness.dark,
          // returns a visual density that is adaptive based on the defaultTargetPlatform
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // define supported locales
        supportedLocales: AppLocalizations.supportedLocales,
        // set the delegates for localizations
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
