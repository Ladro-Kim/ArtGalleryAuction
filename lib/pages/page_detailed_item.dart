import 'package:art_gallery_auction/widgets/widget_small_profile.dart';
import 'package:flutter/material.dart';

class DetailedItemPage extends StatefulWidget {
  @override
  _DetailedItemPageState createState() => _DetailedItemPageState();
}

class _DetailedItemPageState extends State<DetailedItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
              tag: 'test-1',
              child: Image.asset("assets/images/image_dummy.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallProfile(pictureSize: 35, country: 'de', isCountry: true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              ),
              child: Center(child: Text("test content")),
            ),
          ),
        ],
      )
    );
  }
}
