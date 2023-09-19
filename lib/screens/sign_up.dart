import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_control/components/header.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/components/input_text_with_label.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/services/user_service.dart';

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

  String name = '';

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
    if (name.isEmpty) {
      return showDialog1(context, title: '필수입력란 미기입', content: '닉네임을 입력해주세요.');
    }
    if (accountId.length < 4 || accountId.length > 30) {
      return showDialog1(context,
          title: '입력 제한', content: '아이디는 4~30자 이내로 입력해주세요.');
    }
    if (password.length < 6 || password.length > 25) {
      return showDialog1(context,
          title: '입력 제한', content: '비밀번호는 6~25자 이내로 입력해주세요.');
    }
    if (name.length > 16) {
      return showDialog1(context,
          title: '입력 제한', content: '닉네임은 16자 이내로 입력해주세요.');
    }

    // 아이디 중복확인
    bool isValid = await userService.getIsValidId(accountId);
    if (!isValid) {
      if (!mounted) return;
      return showDialog1(context, title: '아이디 중복', content: '이미 사용중인 아이디입니다.');
    }

    // 회원가입 요청
    final data = {'accountId': accountId, 'password': password, 'name': name};
    Response response = await userService.create(data);
    if (response.statusCode != 201) {
      if (!mounted) return;
      showDialog1(context, title: '에러 발생', content: response.statusMessage);
      return;
    }

    if (!mounted) return;
    await showDialog1(context, title: '가입완료', content: '가입이 완료되었습니다!');
    if (!mounted) return;
    Navigator.pop(context);
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
              InputTextWithLabel(
                label: '닉네임',
                detailLable: '1~16자 이내로 입력해주세요.',
                onChanged: (value) {
                  this.name = value;
                },
              ),
              SizedBox(
                height: 60,
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
