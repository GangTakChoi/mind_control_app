import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/screens/sign_up.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/screens/write_day_page.dart';
import 'package:mind_control/utils/dio_client.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: kDefaultPadding,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    SvgPicture.asset('images/logo.svg',
                        semanticsLabel: 'Acme Logo'),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      '마음관리 앱을 이용해주셔서 감사합니다.',
                      style: TextStyle(color: Color(0xff6A6A6A), fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    PrimaryButton(
                      title: '로그인',
                      onPressed: () async {
                        // DioClient dioClient = DioClient();
                        // // final response = await dioClient.get();

                        // print(response);
                        // Navigator.pushNamed(context, WriteDayPage.id);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpPage.id);
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   child: Expanded(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SvgPicture.asset('images/google_button.svg',
              //             semanticsLabel: 'Google'),
              //         SizedBox(
              //           width: 20.0,
              //         ),
              //         SvgPicture.asset('images/apple_button.svg',
              //             semanticsLabel: 'Apple'),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
