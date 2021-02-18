import 'package:art_gallery_auction/utils/enums.dart';
import 'package:art_gallery_auction/widgets/widget_home_view.dart';
import 'package:flutter/material.dart';

class HomeAuctionPage extends StatefulWidget {
  @override
  _HomeAuctionPageState createState() => _HomeAuctionPageState();
}

class _HomeAuctionPageState extends State<HomeAuctionPage> {
  @override
  Widget build(BuildContext context) {
    return HomeView(salesType: SalesType.auction,);
  }
}
