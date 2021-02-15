import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  AnimationController _animController;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    _animController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this);
    _animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: designColorBrownGrey,
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          tween: Tween<double>(begin: 0, end: 1),
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Text("Sign in with Google"),
            onPressed: (){
              SignInWithGoogle();
            },
          ),
          builder: (BuildContext context, double tween ,Widget Child){
            return Padding(
              padding: EdgeInsets.only(top: tween * 40),
              child: Opacity(
                  opacity: tween,
                  child: Child),
            );
          },
        )
      ),
    );
  }

  Future<User> SignInWithGoogle() async {
    GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleAuth = await _googleAccount.authentication;
    User user = (await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    ))).user;
    return user;
  }
}
