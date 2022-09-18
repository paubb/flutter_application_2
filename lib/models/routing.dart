import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';
import 'package:flutter_application_2/views/launch.dart';
import 'package:flutter_application_2/views/recover_pass.dart';
import 'package:flutter_application_2/views/root.dart';
import 'package:flutter_application_2/views/signin.dart';
import 'package:flutter_application_2/views/signup.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launchRoute:
        return MaterialPageRoute(builder: (_) => LaunchPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => RootPage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case signinRoute:
        return MaterialPageRoute(builder: (_) => SigninPage());
      case recoverPassRoute:
        return MaterialPageRoute(builder: (_) => RecoverPassPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
