import 'package:flutter/material.dart';
import 'package:mind_control/components/goal_checking_list_tile.dart';
import 'package:mind_control/models/diary.dart';

class DiaryItemExpand extends StatelessWidget {
  const DiaryItemExpand({
    super.key,
    required this.diary,
  });

  final Diary diary;

  String get content {
    return diary.content;
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
              itemCount: diary.taskCount,
              itemBuilder: (context, index) => GoalCheckingListTile(
                task: diary.tasks[index],
                density: -4,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (content.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                content,
                style: TextStyle(fontSize: 17),
              ),
            )
        ],
      ),
    );
  }
}
// dayRecordBundle.recordOfDay