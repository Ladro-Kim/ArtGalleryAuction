import 'package:art_gallery_auction/widgets/widget_small_profile.dart';
import 'package:flutter/material.dart';

class StoryBoard extends StatefulWidget {
  int index;

  StoryBoard({this.index});

  @override
  _StoryBoardState createState() => _StoryBoardState();
}

class _StoryBoardState extends State<StoryBoard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Wrap(children: [
        Card(
          elevation: 1,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                child: SmallProfile(
                    textSize: 14,
                    isCountry: true,
                    country: 'us',
                    pictureSize: 35),
              ),
              Image.asset(
                'assets/images/image_dummy.png',
                fit: BoxFit.fitWidth,
              ),
              Text("Line1\nLine2\nLine3\nine4"),
            ],
          ),
        ),
      ]),
    );

    // Text(widget.index.toString());
  }
}
