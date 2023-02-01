import 'package:flutter/material.dart';
import 'package:flutter_application_2/app.dart';
import 'package:flutter_application_2/models/Firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  runApp(MyApp());
}
