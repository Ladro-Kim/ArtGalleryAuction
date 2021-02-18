import 'package:art_gallery_auction/pages/page_sign_in.dart';
import 'package:art_gallery_auction/pages/page_tab.dart';
import 'package:art_gallery_auction/providers/firebase_sign_in_out.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => SignInOutProvider()),
      ],
      child: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return TabPage();
            else {
              return SignInPage();
            }
          }),
    );
  }
}
