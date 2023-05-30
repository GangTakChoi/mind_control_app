import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:provider/provider.dart';

class GoalListItem extends StatelessWidget {
  GoalListItem({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kDefaultBackgroundGrayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.title),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('목표 삭제'),
                // content: Text('[${task.title}]를 삭제하시겠습니까?'),
                content: Text.rich(TextSpan(children: [
                  TextSpan(text: '['),
                  TextSpan(
                      text: '${task.title}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ']'),
                  TextSpan(text: '를 삭제하시겠습니까?'),
                ])),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<WriteDayProvider>(context, listen: false)
                          .deleteTask(task);
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text(
                      '삭제',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            icon: Icon(Icons.delete_outline),
          )
        ],
      ),
    );
  }
}
