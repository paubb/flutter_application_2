import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/widgets.dart';
import 'package:flutter_application_2/models/Firebase/auth_service.dart';
import 'package:flutter_application_2/views/welcome.dart';
import 'package:flutter_application_2/views/root.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User>(
        stream: FirebaseAuthService.getAuthStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RootPage();
          } else if (snapshot.hasError) {
            return ErrorMessageWidget(errorMessage: 'Something went wrong!');
          }
          return WelcomePage();
        },
      ),
    );
  }
}
