import 'package:flutter/material.dart';
import 'package:mind_control/components/my_bottom_navigation_bar.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:mind_control/screens/view_days_page.dart';
import 'package:mind_control/components/selectable_box.dart';
import 'package:mind_control/screens/goal_mgmt_page.dart';
import 'package:provider/provider.dart';
import 'package:mind_control/components/goal_checking_list.dart';

class WriteDayPage extends StatefulWidget {
  static const String id = 'write_day_page';
  WriteDayPage({super.key});

  @override
  State<WriteDayPage> createState() => _WriteDayPageState();
}

class _WriteDayPageState extends State<WriteDayPage> {
  int? selectedFeeling;
  TextEditingController recordOfDayInputContrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recordOfDayInputContrl.text =
        Provider.of<WriteDayProvider>(context, listen: false).recordOfDay;
  }

  bool get isDisplayDivider {
    return Provider.of<WriteDayProvider>(context).taskCount > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(context: context),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                '오늘 감정을 선택해주세요',
                style: kDefaultHeadingTextStyle,
              ),
            ),
            SizedBox(
              height: kDefaultSpacing,
            ),
            SingleChildScrollView(
              padding: kDefaultPadding,
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    for (FeelingEmotion feelingEmotion
                        in FeelingEmotion.getFeelingEmotionList())
                      SelectableBox(
                        child: feelingEmotion.svgPicture,
                        feelingValue: feelingEmotion.feelingValue,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '일일 목표',
                    style: kDefaultHeadingTextStyle,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: kDefaultSpacing),
                    decoration: BoxDecoration(
                      color: kDefaultBackgroundGrayColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, GoalMgmtPage.id);
                            },
                            child: Text(
                              '목표관리',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        if (isDisplayDivider)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Divider(
                              color: Colors.black26,
                              thickness: 1,
                            ),
                          ),
                        GoalCheckingList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '하루의 기록',
                    style: kDefaultHeadingTextStyle,
                  ),
                  SizedBox(
                    height: kDefaultSpacing,
                  ),
                  TextFormField(
                    controller: recordOfDayInputContrl,
                    minLines: 15,
                    maxLines: null,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kDefaultBackgroundGrayColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: null,
                    ),
                    onChanged: (value) {
                      Provider.of<WriteDayProvider>(context, listen: false)
                          .recordOfDay = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                      title: '저장',
                      onPressed: () {
                        Navigator.pushNamed(context, ViewDaysPage.id);
                      }),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
