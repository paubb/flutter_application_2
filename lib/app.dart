import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/routing.dart';
import 'package:flutter_application_2/config/constants.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Make statusBar background transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      // Custom Light Theme to assing app bar title to black
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // To change status bar color, working for light theme mode
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routing.generateRoute,
      initialRoute: launchRoute,
    );
  }
}
