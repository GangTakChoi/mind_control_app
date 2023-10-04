import 'package:flutter/material.dart';
import 'package:mind_control/components/complete_goal_grid_view.dart';
import 'package:mind_control/components/record_day_item_expand.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/models/diary.dart';
import 'package:mind_control/services/diary_service.dart';
import 'package:mind_control/utils/show_dialog.dart';
import 'package:mind_control/utils/toast.dart';

class DiaryItem extends StatefulWidget {
  DiaryItem({required this.diary, required this.removeDiary});

  final Diary diary;
  final Function removeDiary;

  @override
  State<DiaryItem> createState() => _DiaryItemState();
}

class _DiaryItemState extends State<DiaryItem> {
  bool isExpanded = false;

  void toggleExpandedState() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Future<void> removeDiary() async {
    final diaryId = widget.diary.id;
    final res = await DiaryService.delete(diaryId);
    if (!mounted) return;
    if (res.statusCode == 200) {
      widget.removeDiary(diaryId);
      CustomToast.showToastNormalType('삭제완료');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                widget.diary.date,
                style: TextStyle(color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () {
                showDialogConfirm(context, removeDiary,
                    title: '기록 삭제', content: '기록을 삭제하시겠습니까?', actionText: '삭제');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.delete_outline,
                  size: 21,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kDefaultBackgroundGrayColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 70,
                child: Row(
                  children: [
                    widget.diary.getIconForFeelingValue(),
                    SizedBox(
                      width: 8,
                    ),
                    CompleteGoalGridView(
                      completeGoalList: widget.diary.getCompleteGoalList(),
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
              if (isExpanded) DiaryItemExpand(diary: widget.diary)
            ],
          ),
        )
      ],
    );
  }
}
