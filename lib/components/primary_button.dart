import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';

const double elevation = 0;

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.title, this.isSecondary = false, required this.onPressed});

  final String title;
  final bool isSecondary;
  final VoidCallback onPressed;

  ButtonStyle getStyle() {
    if (isSecondary) {
      return ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: kDefaultBackgroundGrayColor,
        shape: StadiumBorder(),
      );
    } else {
      return ElevatedButton.styleFrom(
        elevation: elevation,
        shape: StadiumBorder(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: getStyle(),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: isSecondary ? Colors.black : Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
