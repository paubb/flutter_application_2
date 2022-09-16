import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Firebase/fire_auth.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              SizedBox(height: 25),
                              Text(
                                "Hello Again!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              SizedBox(height: 25),
                              Text(
                                "Wellcome back you've been missed!",
                                style: TextStyle(fontSize: 15),
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
                                onChanged: (value) => _status = null,
                              ),
                              SizedBox(height: 25),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                controller: _password,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Center(
                                          child: CircularProgressIndicator()),
                                    );
                                    String status =
                                        await FireAuth.resetPassword(
                                            _email.text);
                                    Navigator.pop(context);
                                    _status = status;
                                  },
                                  child: Text(
                                    "Recovery Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => Center(
                                        child: CircularProgressIndicator()),
                                  );

                                  String status =
                                      await FireAuth.signInUsingEmailPassword(
                                          _email.text, _password.text);
                                  // Pop loading Dialog
                                  Navigator.pop(context);
                                  if (status == 'Success') {
                                    // Pop Signin Page
                                    Navigator.pop(context);
                                  } else {
                                    _status = status;
                                  }
                                },
                                child: Text('Sign in'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  minimumSize: const Size.fromHeight(55),
                                ),
                              ),
                            ],
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
