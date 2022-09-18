import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Explore the application",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, signupRoute);
                            },
                            child: Text('Sign up'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              padding: const EdgeInsets.all(15),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, signinRoute);
                            },
                            child: Text('Sign in'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              padding: const EdgeInsets.all(15),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: 75),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
