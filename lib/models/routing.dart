import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';
import 'package:flutter_application_2/views/edit_profile.dart';
import 'package:flutter_application_2/views/launch.dart';
import 'package:flutter_application_2/views/recover_pass.dart';
import 'package:flutter_application_2/views/root.dart';
import 'package:flutter_application_2/views/signin.dart';
import 'package:flutter_application_2/views/signup.dart';

class Routing {
  static final _routes = <String, WidgetBuilder>{
    launchRoute: (_) => LaunchPage(),
    homeRoute: (_) => RootPage(),
    signupRoute: (_) => SignupPage(),
    signinRoute: (_) => SigninPage(),
    recoverPassRoute: (_) => RecoverPassPage(),
    editProfileRoute: (_) => EditProfilePage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeBuilder = _routes[settings.name];
    if (routeBuilder != null) {
      return MaterialPageRoute(builder: routeBuilder, settings: settings);
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
  }
}
