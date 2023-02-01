import 'package:firebase_core/firebase_core.dart';

Future<void> setupFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}
