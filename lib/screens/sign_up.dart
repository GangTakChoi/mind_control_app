import 'package:flutter/material.dart';
import 'package:mind_control/components/header.dart';
import 'package:mind_control/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/components/input_text_with_label.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/screens/login_page.dart';

class SignUpPage extends StatelessWidget {
  static const String id = 'signup_page';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              Header(
                title: '회원가입',
              ),
              InputTextWithLabel(
                label: '아이디',
              ),
              InputTextWithLabel(
                label: '비밀번호',
              ),
              InputTextWithLabel(
                label: '비밀번호 재입력',
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      title: '가입완료',
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('가입완료'),
                          content: const Text('가입을 축하드립니다!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                      title: '취소',
                      isSecondary: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    )
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
