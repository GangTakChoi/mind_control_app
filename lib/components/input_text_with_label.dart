import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/constants.dart';

class InputTextWithLabel extends StatelessWidget {
  InputTextWithLabel(
      {required this.label,
      this.detailLable,
      this.isObscureText = false,
      this.onChanged,
      this.filteringTextList});

  final String label;
  final String? detailLable;
  final bool isObscureText;
  final void Function(String)? onChanged;
  List<TextInputFormatter>? filteringTextList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(color: kDefaultTextGrayColor),
              ),
              Text(
                detailLable ?? '',
                style: TextStyle(color: kDefaultTextGrayColor, fontSize: 14),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: isObscureText,
            decoration: kTextFieldDecoration,
            onChanged: onChanged,
            inputFormatters: filteringTextList,
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
