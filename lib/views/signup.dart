import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/constants.dart';
import 'package:flutter_application_2/models/Firebase/fire_auth.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String _status;

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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(height: 50),
                                Text(
                                  "Hello!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 25),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Create an account and start using the application",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 25),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: _username,
                                  decoration: InputDecoration(
                                    hintText: "Enter new username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    // Check if this field is empty
                                    if (value == null || value.isEmpty) {
                                      return 'A username is required';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onTap: () => _status = null,
                                ),
                                SizedBox(height: 25),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  controller: _email,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    // Check if this field is empty
                                    if (value == null || value.isEmpty) {
                                      return 'An email is required';
                                    } else if (_status != null) {
                                      return _status;
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onTap: () => _status = null,
                                ),
                                SizedBox(height: 25),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  obscureText: _isObscure,
                                  controller: _password,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: IconButton(
                                        icon: Icon(_isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _isObscure = !_isObscure;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    // Check if this field is empty
                                    if (value == null || value.isEmpty) {
                                      return 'A password is required';
                                    } else if (value.length < 6) {
                                      return 'The password must be minimum 6 characters.';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onTap: () => _status = null,
                                ),
                                SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      );
                                      String status = await FireAuth
                                          .registerUsingEmailPassword(
                                              _username.text.trim(),
                                              _email.text.trim(),
                                              _password.text);
                                      // Unfocus text input
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      // Pop loading Dialog
                                      Navigator.pop(context);
                                      if (status == 'Success') {
                                        // Pop Signup Page
                                        Navigator.pop(context);
                                      } else {
                                        setState(() {
                                          _status = status;
                                        });
                                      }
                                    }
                                  },
                                  child: Text('Sign up'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    minimumSize: const Size.fromHeight(55),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?'),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacementNamed(
                                            context, signinRoute);
                                      },
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
