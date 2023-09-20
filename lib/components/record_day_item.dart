import 'package:flutter/material.dart';
import 'package:mind_control/components/complete_goal_grid_view.dart';
import 'package:mind_control/components/record_day_item_expand.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/models/day_record_bundle.dart';

class RecordDayItem extends StatefulWidget {
  RecordDayItem({required this.dayRecordBundle});

  final DayRecordBundle dayRecordBundle;

  @override
  State<RecordDayItem> createState() => _RecordDayItemState();
}

class _RecordDayItemState extends State<RecordDayItem> {
  bool isExpanded = false;

  void toggleExpandedState() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.dayRecordBundle.date,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kDefaultBackgroundGrayColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 70,
                child: Row(
                  children: [
                    widget.dayRecordBundle.getIconForFeelingValue(),
                    SizedBox(
                      width: 8,
                    ),
                    CompleteGoalGridView(
                      completeGoalList:
                          widget.dayRecordBundle.getCompleteGoalList(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        toggleExpandedState();
                      },
                      child: isExpanded
                          ? Icon(
                              Icons.expand_less,
                              size: 40,
                            )
                          : Icon(
                              Icons.expand_more,
                              size: 40,
                            ),
                    )
                  ],
                ),
              ),
              if (isExpanded)
                RecordDayItemExpand(dayRecordBundle: widget.dayRecordBundle)
            ],
          ),
        )
      ],
    );
  }
}
