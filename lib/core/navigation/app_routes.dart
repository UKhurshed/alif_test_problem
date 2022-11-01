import 'package:alif_test/core/navigation/routes.dart';
import 'package:alif_test/features/upcoming_guides/ui/screens/upcoming_guides_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._internal();

  static final AppRoutes _appRoutes = AppRoutes._internal();

  factory AppRoutes() => _appRoutes;

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.upcomingGuides:
        return MaterialPageRoute(builder: (_) => const UpcomingGuidesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UpcomingGuidesScreen());
    }
  }
}
