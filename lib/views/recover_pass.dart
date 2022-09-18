import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Firebase/fire_auth.dart';

class RecoverPassPage extends StatefulWidget {
  RecoverPassPage({Key key}) : super(key: key);

  @override
  _RecoverPassPageState createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  final _email = TextEditingController();
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
                              Icon(
                                Icons.lock_outline,
                                size: 40,
                              ),
                              SizedBox(height: 25),
                              Text(
                                "Trouble logging in?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              SizedBox(height: 25),
                              Text(
                                "Enter your email adress and we'll send you a link to reset your password.",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
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
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Center(
                                          child: CircularProgressIndicator()),
                                    );
                                    String status =
                                        await FireAuth.resetPassword(
                                            _email.text.trim());
                                    Navigator.pop(context);
                                    _status = status;
                                  }
                                },
                                child: Text('Send email'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  minimumSize: const Size.fromHeight(55),
                                ),
                              ),
                              SizedBox(height: 25),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Back to Login",
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
