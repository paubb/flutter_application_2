import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';

class WelcomePage extends StatelessWidget {
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
                    const Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Explore the application",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SignInOrSignUpButton(
                                text: 'Sign up', route: signupRoute),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SignInOrSignUpButton(
                                text: 'Sign in', route: signinRoute),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 75),
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

class SignInOrSignUpButton extends StatelessWidget {
  final String text;
  final String route;

  SignInOrSignUpButton({@required this.text, @required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}
