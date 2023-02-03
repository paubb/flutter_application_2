import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // Instance of FirebaseAuth
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User> getAuthStateChanges() {
    return _auth.authStateChanges();
  }

  // Register a user using email and password
  static Future<String> registerUsingEmailPassword(
      String name, String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      await user.updateDisplayName(name);
      await user.reload();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'invalid-email':
          return 'Invalid email provided.';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled.';
        case 'weak-password':
          return 'The password provided is too weak.';
        default:
          return 'An error occured with the DB. Please try again later.';
      }
    } catch (e) {
      return 'Unknown error.';
    }
  }

  // Sign in a user using email and password
  static Future<String> signInUsingEmailPassword(
      String email, String password) async {
    try {
      // Attempt to sign in the user
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, return the status message
      return 'Success';
    } on FirebaseAuthException catch (e) {
      // Depending on the error code, return the status message
      switch (e.code) {
        case 'wrong-password':
          return 'Wrong password provided.';
          break;
        case 'invalid-email':
          return 'Invalid email provided.';
          break;
        case 'user-disabled':
          return 'User corresponding to the given email has been disabled.';
          break;
        case 'user-not-found':
          return 'No user found for that email.';
          break;
        default:
          return 'An error occured with the DB. Please try again later.';
      }
    } catch (e) {
      // If an unexpected error occurs, return a status message
      return 'Unknown error.';
    }
  }

  // Sign out the current user
  static Future signOut() async {
    await _auth.signOut();
  }

  // Send a email to reset password
  static Future<String> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Success, an email has been sent.';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'Invalid email provided.';
        case 'user-not-found':
          return 'No user found for that email.';
        default:
          return 'An error occured with the DB. Please try again later.';
      }
    } catch (e) {
      return 'Unknown error.';
    }
  }

  static String getUserInfo() {
    return _auth.currentUser.displayName;
  }

  static Future<String> updateUsername(String name) async {
    try {
      await _auth.currentUser.updateDisplayName(name);
      return 'Success, display name updated.';
    } catch (e) {
      return 'Unknown error.';
    }
  }
}
