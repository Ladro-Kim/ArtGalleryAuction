import 'dart:io';

import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  ImagePicker _imagePicker = ImagePicker();
  PickedFile _pickedImage;
  List<File> _images = [];

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
                labelText: 'How to sell',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item name',
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          backgroundColor: Colors.green,
          elevation: 1,
          actions: [
            ElevatedButton(onPressed: () {
              GetImageFromGallery();
            }, child: Text("Gallery")),
            ElevatedButton(onPressed: (){
              GetImageFromCamera();
            }, child: Text("Camera")),
          ],
        );
      },
    );
  }
}
