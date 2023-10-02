import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_control/components/header.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/input_text_with_label.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/screens/privacy_page.dart';
import 'package:mind_control/services/user_service.dart';
import 'package:mind_control/utils/loading.dart';

import 'package:mind_control/utils/show_dialog.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signup_page';
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  UserService userService = UserService();

  String accountId = '';

  String password = '';

  String rePassword = '';

  bool checkbox1 = false;

  Future<dynamic> requestSignUp(BuildContext context) async {
    if (accountId.isEmpty) {
      return showDialog1(context, title: '필수입력란 미기입', content: '아이디를 입력해주세요.');
    }
    if (password.isEmpty) {
      return showDialog1(context, title: '필수입력란 미기입', content: '비밀번호를 입력해주세요.');
    }
    if (password != rePassword) {
      return showDialog1(context,
          title: '비밀번호 불일치', content: '비밀번호 재입력이 일치하지 않습니다.');
    }
    if (accountId.length < 4 || accountId.length > 30) {
      return showDialog1(context,
          title: '입력 제한', content: '아이디는 4~30자 이내로 입력해주세요.');
    }
    if (password.length < 6 || password.length > 25) {
      return showDialog1(context,
          title: '입력 제한', content: '비밀번호는 6~25자 이내로 입력해주세요.');
    }
    if (!checkbox1) {
      return showDialog1(context, title: '동의', content: '개인정보처리방침에 동의해주세요.');
    }

    LoadingBar.show(context);

    // 아이디 중복확인
    bool isValid = await userService.getIsValidId(accountId);
    if (!isValid) {
      if (!mounted) return;
      LoadingBar.down(context);
      return showDialog1(context, title: '아이디 중복', content: '이미 사용중인 아이디입니다.');
    }

    // 회원가입 요청
    final data = {'accountId': accountId, 'password': password};
    Response res = await userService.create(data);

    if (res.statusCode == 201) {
      LoadingBar.down(context);
      showDialog1(context, title: '가입완료', content: '가입이 완료되었습니다!')
          .then((value) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: ListView(
            children: [
              Header(
                title: '회원가입',
              ),
              InputTextWithLabel(
                label: '아이디',
                detailLable: '4~30자 이내로 입력해주세요.',
                onChanged: (value) {
                  this.accountId = value;
                },
                filteringTextList: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9-_]"))
                ],
              ),
              InputTextWithLabel(
                label: '비밀번호',
                detailLable: '6~25자 이내로 입력해주세요.',
                isObscureText: true,
                onChanged: (value) {
                  this.password = value;
                },
              ),
              InputTextWithLabel(
                label: '비밀번호 재입력',
                isObscureText: true,
                onChanged: (value) {
                  this.rePassword = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: InkWell(
                  onTap: () => Navigator.pushNamed(context, PrivacyPage.id),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "개인정보처리방침 ",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        TextSpan(
                          text: "동의",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                trailing: Checkbox(
                  value: checkbox1,
                  onChanged: (value) {
                    setState(() {
                      checkbox1 = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    title: '가입완료',
                    onPressed: () async {
                      await requestSignUp(context);
                    },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
