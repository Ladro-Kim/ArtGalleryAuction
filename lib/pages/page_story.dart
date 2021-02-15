import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_story.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: designColorBlack,
      appBar: AppBar(
        title: Text("Artist Stories",
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: designColorDeepDarkBrown,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return StoryBoard(index: index);
          }),
    );
  }
}
