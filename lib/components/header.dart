import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            'images/logo.svg',
            semanticsLabel: 'Acme Logo',
            width: 70,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(color: kDefaultTextGrayColor, fontSize: 27),
          )
        ],
      ),
    );
  }
}
