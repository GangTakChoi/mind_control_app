import 'package:flutter/material.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/my_bottom_navigation_bar.dart';
import 'package:mind_control/components/record_day_item.dart';
import 'package:mind_control/fake_data.dart';
import 'package:month_year_picker/month_year_picker.dart';

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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                width: double.infinity,
                alignment: Alignment.center,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    '월 선택',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    final selected = await showMonthYearPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime.now(),
                        locale: Locale('ko'));
                    print(selected);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemCount: fakeData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RecordDayItem(
                        dayRecordBundle: fakeData[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
