import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:provider/provider.dart';

class SelectableBox extends StatelessWidget {
  SelectableBox({required this.child, required this.feelingValue});

  final Widget child;
  final FeelingValue feelingValue;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, innerChild) => GestureDetector(
        onTap: () {
          Provider.of<WriteDayProvider>(context, listen: false)
              .updateFeelingValue(feelingValue);
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Provider.of<WriteDayProvider>(context).currentfeelingValue ==
                    feelingValue
                ? Theme.of(context).primaryColor
                : kDefaultBackgroundGrayColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          width: 90,
          height: 90,
          child: Center(
            child: innerChild,
          ),
        ),
      ),
      child: child,
    );
  }
}
