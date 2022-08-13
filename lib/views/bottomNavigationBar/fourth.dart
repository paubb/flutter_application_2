import 'package:flutter/material.dart';

import '../../models/Firebase/fire_auth.dart';

class FourthPage extends StatefulWidget {
  FourthPage() : super();

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: (isLoading)
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await FireAuth.signOut();
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
