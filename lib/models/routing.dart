import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';
import 'package:flutter_application_2/views/launch.dart';
import 'package:flutter_application_2/views/root.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launchRoute:
        return MaterialPageRoute(builder: (_) => LaunchPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => RootPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
