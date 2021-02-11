import 'package:art_gallery_auction/pages/page_root.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlueOvel Gallery',
      theme: ThemeData(
        splashColor: Colors.yellowAccent,
        fontFamily: "Font1",
        indicatorColor: Colors.indigoAccent,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.indigoAccent,
      ),
      home: SafeArea(child: RootPage()),
    );
  }
}
