import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_test_2/pages/main_page.dart';
import 'package:flutter_bloc_test_2/pages/details_page.dart';

// allows strongly-typed arguments passing and simplifies routes setup
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: false,
  routes: <AutoRoute>[
    // defines a route
    AutoRoute(initial: true, page: MainPage),
    AutoRoute(page: DetailsPage),
  ],
)

// allows to create generated file of routes
class $AppRouter {}
