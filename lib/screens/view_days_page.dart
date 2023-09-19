import 'package:flutter/material.dart';
import 'package:mind_control/components/calendar_button_section.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/my_bottom_navigation_bar.dart';
import 'package:mind_control/components/record_day_item.dart';
import 'package:mind_control/fake_data.dart';
// import 'package:month_year_picker/month_year_picker.dart';

class ViewDaysPage extends StatelessWidget {
  static const String id = 'view_day_page';
  const ViewDaysPage({super.key});

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
              itemCount: fakeData.length,
              itemBuilder: (context, index) {
                // if (index == 0) {
                //   return CalendarButtonSection();
                // }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RecordDayItem(
                    dayRecordBundle: fakeData[index],
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
