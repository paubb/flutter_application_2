import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to initialize Firebase
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Stream<User> checkLoggedUser() {
    return _auth.userChanges();
  }

  static Future<String> registerUsingEmailPassword(
      String name, String email, String password) async {
    String status = 'Undefined Error';
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      await user.updateDisplayName(name);
      await user.reload();
      status = 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        status = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        status = 'Invalid email provided.';
      } else if (e.code == 'operation-not-allowed') {
        status = 'Email/password accounts are not enabled.';
      } else if (e.code == 'weak-password') {
        status = 'The password provided is too weak.';
      } else
        status = 'An error occured. Please try again later.';
    } catch (e) {
      status = e;
    }
    return status;
  }

  static Future<String> signInUsingEmailPassword(
      String email, String password) async {
    String status;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      status = 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        status = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        status = 'Invalid email provided.';
      } else if (e.code == 'user-disabled') {
        status = 'User corresponding to the given email has been disabled.';
      } else if (e.code == 'user-not-found') {
        status = 'No user found for that email.';
      } else
        status = 'An error occured. Please try again later.';
    } catch (e) {
      status = e;
    }
    return status;
  }

  static Future signOut() async {
    await _auth.signOut();
  }

  static Future<String> resetPassword(String email) async {
    String status;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      status = 'Success, an email has been sent.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        status = 'Invalid email provided.';
      } else if (e.code == 'user-not-found') {
        status = 'No user found for that email.';
      } else
        status = 'An error occured. Please try again later.';
    } catch (e) {
      status = e;
    }
    return status;
  }
}
