import 'package:flutter/material.dart';
import 'package:multi_purpose_app/ui/login/login_screen.dart';
import 'package:multi_purpose_app/ui/navbar/navbar.dart';
import 'package:multi_purpose_app/ui/splash_screen.dart';

part 'route_arguments.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const navbar = '/navbar';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );

      case Routes.navbar:
        return MaterialPageRoute(
          builder: (_) => Navbar(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
    }
  }
}
