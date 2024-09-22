import 'package:flutter/material.dart';
import 'package:test2/main.dart';
import 'package:test2/second_page.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondRoute(
          data:args.toString(),
        ));

        default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error")
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}