import 'package:art_gallery_auction/widgets/widget_country_flag.dart';
import 'package:flutter/material.dart';

class SmallProfile extends StatefulWidget {
  String country;
  double textSize;
  double pictureSize;
  bool isCountry;
  double width;

  SmallProfile(
      {this.country,
      this.textSize = 15,
      this.pictureSize = 35,
      this.isCountry = false,
      this.width});

  @override
  _SmallProfileState createState() => _SmallProfileState();
}

class _SmallProfileState extends State<SmallProfile> {
  var _networkImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/dummy_person.png',
                  fit: BoxFit.fitHeight,
                  width: widget.pictureSize,
                  height: widget.pictureSize,
                ),
              ),
            ),
            Text(
              'Artist name\nemail@email.com',
              style: TextStyle(fontSize: widget.textSize),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget.isCountry
                ? CountryFlag(country: 'kr', size: 24)
                : Container(),
            Icon(Icons.favorite),
          ],
        ),
      ],
    );
  }
}
