import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_custom_title.dart';
import 'package:art_gallery_auction/widgets/widget_listview_horizontal.dart';
import 'package:art_gallery_auction/widgets/widget_sliver_persistent_header.dart';
import 'package:art_gallery_auction/widgets/widget_title_and_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeGeneralPage extends StatefulWidget {
  @override
  _HomeGeneralPageState createState() => _HomeGeneralPageState();
}

class _HomeGeneralPageState extends State<HomeGeneralPage> {
  List<DropdownMenuItem> _dropDownItems = [
    DropdownMenuItem(value: "Menu1", child: Text("Menu1")),
    DropdownMenuItem(value: "Menu2", child: Text("Menu2")),
    DropdownMenuItem(value: "Menu3", child: Text("Menu3")),
  ];

  List<String> _dummyImages = [
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
  ];

  FixedExtentScrollController pickerController;
  String pickerValue = "select";

  @override
  void initState() {
    pickerController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    pickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              CustomTitle(textColor: Colors.redAccent, title: "Today's Hot", backgroundColor: designColorBrightGrey),
              SizedBox(height: 8),
              HorizontalListview(items: _dummyImages),
            ],
          ),
          SizedBox(height: 8),
        ])),
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverHeader(
                minHeight: 120,
                maxHeight: 120,
                child: Container(
                  color: designColorBrightGrey,
                  child: Column(
                    children: [
                      TitleAndDropdown(
                          title: "Artworks",
                          items: _dropDownItems,
                          color: Colors.blue,
                          icon: Icon(
                            Icons.sort,
                            color: Colors.grey,
                            size: 20,
                          )),
                      _buildCategories(),
                    ],
                  ),
                ))),
        SliverGrid.count(
          childAspectRatio: 1,
          crossAxisCount: 2,
          children: List.generate(
              _dummyImages.length,
              (index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(_dummyImages[index]),
                          Text(index.toString()),
                        ],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(
            onChanged: (index) {},
            items: _dropDownItems,
            hint: Text(" ")),
        DropdownButton(
            onChanged: (index) {},
            items: _dropDownItems,
            hint: Text(" ")),
        ElevatedButton.icon(
            onPressed: (){},
            icon: Icon(Icons.nature_outlined), label: Text(pickerValue))
      ],
    );
  }

  // Widget CupertinoPicker(){
  //           showCupertinoModalPopup(
  //               context: context,
  //               builder: (context) {
  //                 return Container(
  //                   height: 400,
  //                   child: Column(
  //                     children: [
  //                       Expanded(child: CupertinoPicker(
  //                         itemExtent: 50,
  //                         backgroundColor: Colors.white,
  //                         scrollController: pickerController,
  //                         onSelectedItemChanged: (index) {
  //                         },
  //                       ))
  //                     ],
  //                   ),
  //                 );
  //               });
  //         }
}
