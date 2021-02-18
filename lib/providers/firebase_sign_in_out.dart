import 'package:art_gallery_auction/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInOutProvider extends ChangeNotifier {
  User firebaseUser;
  CustomUser appUser;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> SignInWithGoogle() async {
    GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleAuth = await _googleAccount.authentication;
    User user = (await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    ))).user;
    notifyListeners();
    return user;
  }

  void SignOut() {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
    notifyListeners(); // stream & notifyListeners..
  }
}