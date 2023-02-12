import 'package:flutter/material.dart';
import 'package:pull_refresh/Presentation/Screens/Dashboard/UI/dashboard.dart';
import 'package:pull_refresh/Presentation/Screens/login_page/UI/login_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: "Login page with overlay"),
        );

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Dashboard(title: "Dashboard", username: args),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
