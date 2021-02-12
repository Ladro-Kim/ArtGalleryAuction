import 'package:art_gallery_auction/pages/page_root.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
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
      title: 'BlueObel Gallery',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(fontSize: 15, color: Colors.black87),
        ),
        accentColor: designColorGrey,
        splashColor: designColorBrightBrown,
        fontFamily: "Font1",
        indicatorColor: designColorDarkBrown,
        scaffoldBackgroundColor: Color.fromARGB(255, 253, 253, 253),
        canvasColor: designColorDarkBrown,
      ),
      home: SafeArea(child: RootPage()),
    );
  }
}
