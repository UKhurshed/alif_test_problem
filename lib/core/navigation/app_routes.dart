import 'package:alif_test/core/navigation/routes.dart';
import 'package:alif_test/features/top_headlines/ui/screens/detail_top_headlines_screen.dart';
import 'package:alif_test/features/top_headlines/ui/screens/top_headlines_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._internal();

  static final AppRoutes _appRoutes = AppRoutes._internal();

  factory AppRoutes() => _appRoutes;

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.topHeadlines:
        return MaterialPageRoute(builder: (_) => const TopHeadlinesScreen());
      case Routes.topHeadlinesUrlToWeb:
        String urlToWeb = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => TopHeadlinesUrlToWebScreen(urlToWeb: urlToWeb));
      default:
        return MaterialPageRoute(builder: (_) => const TopHeadlinesScreen());
    }
  }
}
