import 'package:flutter/material.dart';
import 'package:pull_refresh/cubit/counter_cubit.dart';
import 'package:pull_refresh/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterCubit(),
            child: const HomePage(title: "Flutter Bloc"),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Erro"),
        ),
        body: const Center(
          child: Text("Error! No page found"),
        ),
      );
    });
  }
}
