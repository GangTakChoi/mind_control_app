import 'package:flutter/material.dart';

class LoadingBar {
  static show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  static down(BuildContext context) {
    Navigator.pop(context);
  }
}
