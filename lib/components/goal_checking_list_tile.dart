import 'package:flutter/material.dart';
import 'package:mind_control/models/task.dart';

class GoalCheckingListTile extends StatelessWidget {
  GoalCheckingListTile(
      {super.key, required this.task, this.onChanged, this.density = -2});

  final Task task;
  final void Function(bool?)? onChanged;
  final double density;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: density),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 5,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Checkbox(
          onChanged: onChanged,
          value: task.isChecked,
        ),
      ),
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
