import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/goal_list_item.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:mind_control/screens/add_goal.dart';
import 'package:provider/provider.dart';

class GoalMgmtPage extends StatefulWidget {
  static const String id = 'goal_mgmt_page';
  const GoalMgmtPage({super.key});

  @override
  State<GoalMgmtPage> createState() => _GoalMgmtPageState();
}

class _GoalMgmtPageState extends State<GoalMgmtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '일일 목표',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddGoalScreen());
        },
      ),
      body: Container(
        padding: kDefaultPadding,
        width: double.infinity,
        child: Consumer<WriteDayProvider>(
          builder: (context, writeDayProvider, child) => ListView.builder(
            padding: EdgeInsets.only(top: 30),
            itemBuilder: (context, index) {
              return GoalListItem(
                task: writeDayProvider.tasks[index],
              );
            },
            itemCount: writeDayProvider.taskCount,
          ),
        ),
      ),
    );
  }
}
