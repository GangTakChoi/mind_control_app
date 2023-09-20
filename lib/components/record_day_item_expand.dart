import 'package:flutter/material.dart';
import 'package:mind_control/components/goal_checking_list_tile.dart';
import 'package:mind_control/models/day_record_bundle.dart';

class RecordDayItemExpand extends StatelessWidget {
  const RecordDayItemExpand({
    super.key,
    required this.dayRecordBundle,
  });

  final DayRecordBundle dayRecordBundle;

  String? get recordOfDayText {
    return dayRecordBundle.recordOfDay;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              itemCount: dayRecordBundle.taskCount,
              itemBuilder: (context, index) => GoalCheckingListTile(
                task: dayRecordBundle.tasks[index],
                density: -4,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: recordOfDayText == null
                ? Text(
                    '작성된 내용이 없습니다.',
                    style: TextStyle(fontSize: 17, color: Colors.black45),
                  )
                : Text(
                    recordOfDayText ?? '',
                    style: TextStyle(fontSize: 17),
                  ),
          )
        ],
      ),
    );
  }
}
// dayRecordBundle.recordOfDay