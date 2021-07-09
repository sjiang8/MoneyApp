import 'dart:html';
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../api/firebase_api.dart';
import '../widget/chat_body_widget.dart';
import '../widget/chat_header_widget.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ChatHeaderWidget(users: users),
              ChatBodyWidget(users: users)
            ],
          ),
        ),
      );
}
