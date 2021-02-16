import 'package:art_gallery_auction/pages/page_detailed_item.dart';
import 'package:art_gallery_auction/widgets/widget_small_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

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
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.6,
        onTap: (index){},
          control: SwiperControl(
            color: Colors.blueAccent
          ),
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
          ),
          autoplay: true,
          autoplayDelay: 4000,
          scrollDirection: Axis.horizontal,
          duration: 500,
          curve: Curves.fastOutSlowIn,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    child: Hero(
                      tag: 'test-$index',
                      child: Image.asset(widget.items[index],
                          fit: BoxFit.fitHeight, height: 180,),
                    ),
                    onTap: () {
                      Get.to(DetailedItemPage());
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedItemPage()));
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
            );
          }),
    );
  }
}
