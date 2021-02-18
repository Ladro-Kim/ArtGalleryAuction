import 'package:art_gallery_auction/pages/page_chat.dart';
import 'package:art_gallery_auction/pages/page_home.dart';
import 'package:art_gallery_auction/pages/page_profile.dart';
import 'package:art_gallery_auction/pages/page_story.dart';
import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int pageIndex = 0;
  List<Widget> pages = [HomePage(), StoryPage(), ChatPage(), ProfilePage()];

  BottomNavigationBar BuildBottomNavigationBar() {
    List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_outlined), label: "Story"),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), label: "Profile"),
    ];
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: bottomNavItems,
      currentIndex: pageIndex,
      onTap: (index) {
        pageIndex = index;
        notifyListeners();
      },
    );
  }



}