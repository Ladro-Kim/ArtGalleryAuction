import 'package:art_gallery_auction/pages/page_home_auction.dart';
import 'package:art_gallery_auction/pages/page_home_general.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tabs = [
    Tab(text: "On General"),
    Tab(text: "On Auction"),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: _tabs.length, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 3,
        child: Text("Drawer"),
      ),
      appBar: AppBar(
        title: Text("BlueObel Gallery",
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: designColorDarkBrown,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTabBar(),
          _buildTabBarView(),
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      labelStyle: Theme.of(context).textTheme.headline2,
      labelColor: Colors.black87,
      tabs: _tabs,
      controller: _tabController,
      onTap: (index) {},
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeGeneralPage(),
          HomeAuctionPage(),
        ],
      ),
    );
  }
}
