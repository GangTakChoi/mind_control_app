import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/my_bottom_navigation_bar.dart';
import 'package:mind_control/components/record_day_item.dart';
import 'package:mind_control/models/diary.dart';
import 'package:mind_control/services/diary_service.dart';
// import 'package:month_year_picker/month_year_picker.dart';

class ViewDaysPage extends StatefulWidget {
  static const String id = 'view_day_page';
  const ViewDaysPage({super.key});

  @override
  State<ViewDaysPage> createState() => _ViewDaysPageState();
}

class _ViewDaysPageState extends State<ViewDaysPage> {
  List<Diary> _diaries = <Diary>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DiaryService.getList().then((value) {
      setState(() {
        _diaries = value;
      });
    });
  }

  void removeDiary(String id) {
    setState(() {
      _diaries.removeWhere((diary) => diary.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: Container(
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: _diaries.length,
              itemBuilder: (context, index) {
                // if (index == 0) {
                //   return CalendarButtonSection();
                // }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DiaryItem(
                    diary: _diaries[index],
                    removeDiary: removeDiary,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
