import 'package:flutter/material.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:mind_control/services/goal_service.dart';
import 'package:provider/provider.dart';

class AddGoalScreen extends StatelessWidget {
  AddGoalScreen({super.key});

  String addingTaskText = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
          child: Column(children: [
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              onChanged: (value) => addingTaskText = value,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
              onPressed: () async {
                if (addingTaskText == '') return;

                GoalService goalService = GoalService();
                await goalService.create(addingTaskText);

                Provider.of<WriteDayProvider>(context, listen: false)
                    .setTasks();

                Navigator.pop(context);
              },
              child: Text(
                '추가',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
