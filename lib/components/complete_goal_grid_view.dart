// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CompleteGoalGridView extends StatelessWidget {
  CompleteGoalGridView({super.key, required this.completeGoalList});

  List<String> completeGoalList = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: StaggeredGridWidget(
          completeGoalList: completeGoalList,
        ),
        // child: TemprapryBasicGrid(),
      ),
    );
  }
}

class StaggeredGridWidget extends StatelessWidget {
  StaggeredGridWidget({super.key, required this.completeGoalList});

  List<String> completeGoalList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      child: StaggeredGrid.count(
        axisDirection: AxisDirection.right,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(
          completeGoalList.length,
          (index) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffC8C7FF),
              ),
              child: Text(completeGoalList[index]),
            );
          },
        ),
      ),
    );
  }
}
