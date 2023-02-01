import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;

  ErrorMessageWidget({@required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error, size: 50, color: Colors.red),
          SizedBox(height: 20),
          Text(errorMessage),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
