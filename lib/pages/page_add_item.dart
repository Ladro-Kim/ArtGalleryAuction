import 'dart:io';
import 'package:art_gallery_auction/models/item.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_custom_switch.dart';
import 'package:art_gallery_auction/widgets/widget_time_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  ImagePicker _imagePicker;
  PickedFile _pickedImage;
  List<File> _images = [];

  Item item;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    item = Item();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: designColorBrightGrey,
      appBar: AppBar(
        title: Text("Upload Item Page",
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: designColorDeepDarkBrown,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.builder(
                  itemCount: _images.length > 0 ? _images.length : 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: _images.length > 0
                            ? Image.file(
                                _images[index],
                                fit: BoxFit.cover,
                              )
                            : Image.asset('assets/images/image_dummy.png'),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                child: Text("Add Picture"),
                onPressed: () async {
                  await ShowImageDialog(context);
                }),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Discount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TimeText(title: 'Upload', value: "${item.uploadDate}"),
            TimeText(title: 'Expire', value: "${item.expireDate}"),
            CustomSwitch(switchValue: item.isAuction, title: 'Sales type', falseText: 'General', trueText: 'Auction'),
            CustomSwitch(switchValue: item.isVisible, title: 'Public', falseText: 'False', trueText: 'True'),
            CustomSwitch(switchValue: item.isDeliveryPay, title: 'Delivery pay', falseText: 'Artist', trueText: 'Buyer'),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'delivery pay',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'hashTags',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future GetImageFromGallery() async {
    _pickedImage = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (_pickedImage == null) return;
      _images.add(File(_pickedImage.path));
      Get.back();
    });
  }

  Future GetImageFromCamera() async {
    _pickedImage = await _imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      if (_pickedImage == null) return;
      _images.add(File(_pickedImage.path));
      Get.back();
    });
  }

  void ShowImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.photo, color: Colors.blue),
                        Text(
                          " Gallery",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("Get a picture from Gallery.\n"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.camera, color: Colors.orangeAccent),
                        Text(" Camera",
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("Turn on the Camera and take a picture."),
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actionsPadding: EdgeInsets.symmetric(horizontal: 6),
          actions: [
            TextButton(
              child: Text("Gallery", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                GetImageFromGallery();
              },
            ),
            TextButton(
              child:
                  Text("Camera", style: TextStyle(color: Colors.orangeAccent)),
              onPressed: () {
                GetImageFromCamera();
              },
            ),
          ],
        );
      },
    );
  }
}
