import 'package:art_gallery_auction/pages/page_detailed_item.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_small_profile.dart';
import 'package:flutter/material.dart';

class HorizontalListview extends StatefulWidget {
  List<String> items;

  HorizontalListview({@required this.items});

  @override
  _HorizontalListviewState createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          reverse: false,
          itemCount: widget.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 270,
              child: Card(
                elevation: 1,
                shadowColor: designColorGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Hero(
                          tag: 'test-$index',
                          child: Image.asset(widget.items[index],
                              fit: BoxFit.fitWidth),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedItemPage()));
                        },
                      ),
                      SizedBox(height: 10),
                      SmallProfile(
                        pictureSize: 20,
                        isCountry: false,
                        textSize: 10,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
