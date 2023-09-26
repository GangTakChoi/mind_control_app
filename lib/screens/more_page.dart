import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/components/delete_user_tile.dart';
import 'package:mind_control/components/header.dart';
import 'package:mind_control/components/logout_tile.dart';
import 'package:mind_control/components/my_bottom_navigation_bar.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/screens/goal_mgmt_page.dart';
import 'package:mind_control/screens/privacy_page.dart';
import 'package:mind_control/screens/terms_page.dart';

class MorePage extends StatelessWidget {
  static const id = 'more_page';
  const MorePage({super.key});

  getDivider() {
    return Divider(
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(context: context),
      body: Padding(
        padding: kDefaultPadding,
        child: SafeArea(
          child: Column(
            children: [
              Header(title: '더보기'),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      leading: SvgPicture.asset('images/goal_icon.svg'),
                      title: Text(
                        '목표 관리',
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, GoalMgmtPage.id),
                    ),
                    getDivider(),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      leading: SvgPicture.asset('images/security.svg'),
                      title: Text(
                        '개인정보처리방침',
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () => Navigator.pushNamed(context, PrivacyPage.id),
                    ),
                    // ListTile(
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: SvgPicture.asset('images/document.svg'),
                    //   title: Text(
                    //     '이용약관',
                    //     style: TextStyle(fontSize: 22),
                    //   ),
                    //   onTap: () => Navigator.pushNamed(context, TermsPage.id),
                    // ),
                    getDivider(),
                    LogoutTile(),
                    DeleteUserTile(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
