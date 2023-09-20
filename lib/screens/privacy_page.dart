import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  static const String id = 'privacy_page';
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '개인정보처리방침',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('개인정보처리방침 페이지'),
        ),
      ),
    );
  }
}
