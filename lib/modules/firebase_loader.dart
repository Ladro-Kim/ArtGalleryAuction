import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FireStore 구조
// Collection(사용자Email) - salesList - data
//                        - purchaseList - 주소 data
//                        - stories - 주소 data
//                        - favorites - 주소 data
//                        - carts - 주소 data
//                        - userInfo - data
// Collection('products') - general - data
//                        - auction - data
//                        - stories - data
// 아이템은 products 콜렉션에 있고 사용자는 products 주소를 참조..?


class FirebaseHandler {
  Future<String> PostPictureToFirestorage() async {
    // _firebaseStorageRef = await FirebaseStorage.instance.ref()
    //     .child('path1')           userPictures
    //     .child('path2')           userEmailAddress
    //     .putFile(file);           PictureFile named DateTime.now() for filter
    // String uri = _firebaseStorageRef.ref().getDownloadURL();
    // return uri;
  }

  void GetUserFromFirestore() {

  }

  void SetUserToFirestore(User user) {
    var doc = FirebaseFirestore.instance.collection('User').doc();
  }

}