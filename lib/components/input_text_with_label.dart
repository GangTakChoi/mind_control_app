import 'package:flutter/material.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/constants.dart';

class InputTextWithLabel extends StatelessWidget {
  InputTextWithLabel(
      {required this.label, this.isObscureText = false, this.onChanged});

  final String label;
  final bool isObscureText;
  final void Function(String)? onChanged;

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
          TextFormField(
            obscureText: isObscureText,
            decoration: kTextFieldDecoration,
            onChanged: onChanged,
          ),
          // TextField(
          //   obscureText: isObscureText,
          //   decoration: kTextFieldDecoration,
          //   onChanged: (value) => print(value),
          // )
        ],
      ),
    );
  }
}
