import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/widgets.dart';
import 'package:flutter_application_2/views/welcome.dart';
import 'package:flutter_application_2/views/root.dart';

import '../models/Firebase/fire_auth.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FireAuth.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: FutureBuilder(
                future: _getLandingPage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    }
                    return ErrorMessageWidget(errorMessage: 'Error!');
                  } else if (snapshot.hasError) {
                    return ErrorMessageWidget(
                        errorMessage: 'ERROR: ${snapshot.error}');
                  }
                  return LoadingWidget();
                },
              ),
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Future<Widget> _getLandingPage() async {
    return StreamBuilder(
      stream: FireAuth.checkLoggedUser(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return ErrorMessageWidget(errorMessage: 'Something went wrong!');
        } else if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
          return RootPage();
        }
        return WelcomePage();
      },
    );
  }
}
