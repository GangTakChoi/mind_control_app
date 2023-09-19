import 'package:flutter/material.dart';
// import 'package:month_year_picker/month_year_picker.dart';

class CalendarButtonSection extends StatelessWidget {
  const CalendarButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // final selected = await showMonthYearPicker(
          //     context: context,
          //     initialDate: DateTime.now(),
          //     firstDate: DateTime(2019),
          //     lastDate: DateTime.now(),
          //     locale: Locale('ko'));
          // print(selected);
        },
      ),
    );
  }
}
