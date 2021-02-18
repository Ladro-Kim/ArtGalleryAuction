import 'package:art_gallery_auction/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          bottomNavigationBar: provider.BuildBottomNavigationBar(),
          body: provider.pages[provider.pageIndex],
        );
      },
    );
  }
}
