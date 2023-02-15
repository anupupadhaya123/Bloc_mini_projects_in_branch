import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/business_logic/bloc/homepage_bloc.dart';
import 'package:pull_refresh/data/repo/homepage_repo.dart';
import 'package:pull_refresh/presentation/screens/homepage.dart';

class RouteGenerator {
  final HomepageBloc _homepageBloc = HomepageBloc(HomePageRepo());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomepageBloc>.value(
            value: _homepageBloc,
            child: const MyHomePage(title: "API & BLOC"),
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
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
