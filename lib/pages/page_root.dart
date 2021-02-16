import 'package:art_gallery_auction/pages/page_sign_in.dart';
import 'package:art_gallery_auction/pages/page_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TabPage();
        }
        else if (snapshot.hasData)
          return TabPage();
        else {
          return SignInPage();
        }
      }
    );
  }
}
