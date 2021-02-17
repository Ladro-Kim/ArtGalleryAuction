import 'package:art_gallery_auction/providers/firebase_uploader.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_custom_expanded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: designColorBrightGrey,
      appBar: AppBar(
        title: Text("Profile",
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: designColorDeepDarkBrown,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/dummy_person.png',
                                fit: BoxFit.fitHeight,
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('UserName'),
                                  Text('userEmailAddress@email.com')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Country"),
                        Text("Address"),
                        Text("Phone Number"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.done, content: 'Sales History'),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.card_travel, content: 'Purchase History'),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.book_outlined, content: 'My Stories'),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.favorite, content: 'My Hearts'),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.shopping_cart_outlined, content: 'Cart'),
            ),
            Card(
              elevation: 1,
              child: CustomExpandedButton(icon: Icons.logout, content: 'Log out'),
            ),

          ],
        ),
      ),
    );
  }
}
