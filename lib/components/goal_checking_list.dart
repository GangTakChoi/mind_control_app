import 'package:flutter/material.dart';
import 'package:mind_control/components/goal_checking_list_tile.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:provider/provider.dart';

class GoalCheckingList extends StatelessWidget {
  const GoalCheckingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WriteDayProvider>(
      builder: (context, writeDayProvider, child) => ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final task = writeDayProvider.tasks[index];
          return GoalCheckingListTile(
            task: task,
            onChanged: (value) {
              writeDayProvider.toggleTaskCheckingState(task);
            },
          );
        },
        itemCount: writeDayProvider.taskCount,
      ),
    );
  }
}
