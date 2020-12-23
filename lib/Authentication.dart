import 'package:firebase_auth/firebase_auth.dart';
// import 'package:frbse_auth_new/SigninPage.dart';
// import 'package:flutter/material.dart';
// import 'SignUpPage.dart';
// import 'package:frbse_auth_new/SigninPage.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseauth;

  AuthenticationService(this._firebaseauth);

  //statechange determining var
  //to direct it to respective page
  Stream<User> get authStateChanges => _firebaseauth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signUp(String email, String password) async {
    
    try {
      await _firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);
      return signIn(email:email,password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  // Future<String> signUpcheck(String email, String password) async {
    
  //   try {
  //     await _firebaseauth.;
  //     return "Signed up";
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }


  Future<void> signOut() async {
    await _firebaseauth.signOut();
  }
}
