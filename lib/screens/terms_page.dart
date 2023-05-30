import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  static const String id = 'terms_page';

  const TermsPage({super.key});

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
          '이용약관',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('이용약관 페이지'),
        ),
      ),
    );
  }
}
