import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/routing.dart';
import 'package:flutter_application_2/config/themes.dart';
import 'package:flutter_application_2/config/constants.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android dark icons
        statusBarBrightness: Brightness.light, // For iOS dark icons
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        // Custom Light Theme to assing app bar title to black
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routing.generateRoute,
        initialRoute: launchRoute,
      ),
    );
  }
}
