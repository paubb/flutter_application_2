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
                          Expanded(child: SignUpViewButton()),
                          const SizedBox(width: 10),
                          Expanded(child: SignInViewButton()),
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

class SignUpViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushNamed(context, signupRoute);
      },
      child: const Text('Sign up'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}

class SignInViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushNamed(context, signinRoute);
      },
      child: const Text('Sign in'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}
