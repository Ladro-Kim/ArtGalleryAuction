import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // 시간, Map<사용자, List<대화내용>
  Map<String, Map<String, List<String>>> talks = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: talks.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(index.toString()),
            );
          }),
    );
  }
}
