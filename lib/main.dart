import 'package:art_gallery_auction/pages/page_add_item.dart';
import 'package:art_gallery_auction/pages/page_root.dart';
import 'package:art_gallery_auction/pages/page_sign_in.dart';
import 'package:art_gallery_auction/pages/page_tab.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/RootPage',
      getPages: [
        GetPage(
            name: '/RootPage',
            page: () => RootPage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(
            name: '/SignInPage',
            page: () => SignInPage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(
            name: '/TabPage',
            page: () => TabPage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(
            name: '/AddItemPage',
            page: () => AddItemPage(),
            transition: Transition.size,
            transitionDuration: Duration(milliseconds: 400)),
      ],
      // routes: {
      //   '/RootPage': (context) => RootPage(),
      //   '/SignInPage': (context) => SignInPage(),
      //   '/TabPage': (context) => TabPage(),
      // },
      title: 'BlueObel Gallery',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(fontSize: 15, color: Colors.black87),
        ),
        accentColor: designColorGrey,
        splashColor: designColorBrightBrown,
        fontFamily: "Font1",
        indicatorColor: designColorDeepDarkBrown,
        scaffoldBackgroundColor: Color.fromARGB(255, 253, 253, 253),
        canvasColor: designColorDeepDarkBrown,
      ),
      home: SafeArea(child: RootPage()),
    );
  }
}
