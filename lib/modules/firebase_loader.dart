import 'package:art_gallery_auction/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoader {
  CustomUser appUser;

  FirebaseFirestore _firestore;
  FirebaseStorage _firebaseStorageRef;

  Future<String> UploadPictureToFirestorage() async {
    // _firebaseStorageRef = FirebaseStorage.instance.ref()
    //     .child('path1')
    //     .child('path2')
    //     .putFile(file);
    // String uri = _firebaseStorageRef.ref().getDownloadURL();
    // return uri;
  }

  void UploadJsonToFirestore() {

  }

}