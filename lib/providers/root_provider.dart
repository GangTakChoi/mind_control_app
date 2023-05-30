import 'package:flutter/material.dart';
import 'package:mind_control/screens/login_page.dart';
import 'package:mind_control/screens/more_page.dart';
import 'package:mind_control/screens/view_days_page.dart';
import 'package:mind_control/screens/write_day_page.dart';

class RootProvider extends ChangeNotifier {
  int _indexOfPage = 0;

  int get indexOfPage => _indexOfPage;
  set setIndexForPage(int index) => _indexOfPage = index;
  void updateIndexForPage(BuildContext context, int index) {
    _indexOfPage = index;
    if (index == 0) {
      // Navigator.maybePop(context, WriteDayPage());
      Navigator.pushNamed(context, WriteDayPage.id);
    } else if (index == 1) {
      Navigator.pushNamed(context, ViewDaysPage.id);
    } else if (index == 2) {
      Navigator.pushNamed(context, MorePage.id);
    } else {
      Navigator.pushNamed(context, LoginPage.id);
    }
  }
}
