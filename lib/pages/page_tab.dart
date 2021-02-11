import 'package:art_gallery_auction/pages/page_chat.dart';
import 'package:art_gallery_auction/pages/page_current_item.dart';
import 'package:art_gallery_auction/pages/page_home.dart';
import 'package:art_gallery_auction/pages/page_profile.dart';
import 'package:art_gallery_auction/pages/page_story.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _pageIndex = 0;
  List<Widget> _pages = [HomePage(), StoryPage(), ChatPage(), ProfilePage(), CurrentItemsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _pages[_pageIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    List<BottomNavigationBarItem> _bottomNavItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_outlined), label: "Story"),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), label: "Profile"),
      BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined), label: "CurrentItems"),
    ];

    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: _bottomNavItems,
      currentIndex: _pageIndex,
      onTap: (index){
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }
}
