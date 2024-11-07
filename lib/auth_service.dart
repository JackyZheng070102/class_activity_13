import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Constructor
  AuthService();

  // Method to register a user with email and password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Returns the newly registered user
    } catch (e) {
      print("Registration failed: $e");
      return null;
    }
  }

  // Method to sign in a user with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Returns the signed-in user
    } catch (e) {
      print("Sign-in failed: $e");
      return null;
    }
  }

  // Method to sign out the current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out successfully.");
    } catch (e) {
      print("Sign out failed: $e");
    }
  }

  // Method to get the current user (if signed in)
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Method to change the user's password
  Future<void> changePassword(String newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
      print("Password changed successfully.");
    } catch (e) {
      print("Password change failed: $e");
    }
  }
}
