import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/Presentation/Screens/Dashboard/UI/dashboard.dart';
import 'package:pull_refresh/Presentation/Screens/login_page/UI/login_page.dart';
import 'package:pull_refresh/business_logic/cubit/login_cubit.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const MyHomePage(title: "Login page with overlay"),
          ),
        );

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => LoginCubit(),
              child: Dashboard(title: "Dashboard", username: args),
            ),
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
