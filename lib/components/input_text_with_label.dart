import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';

class InputTextWithLabel extends StatelessWidget {
  InputTextWithLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: kDefaultTextGrayColor),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: kTextFieldDecoration,
          )
        ],
      ),
    );
  }
}
