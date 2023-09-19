import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mind_control/components/header.dart';
import 'package:mind_control/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/components/input_text_with_label.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/screens/login_page.dart';
import 'package:mind_control/services/user_service.dart';
import 'package:mind_control/utils/dio_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatelessWidget {
  static const String id = 'signup_page';
  SignUpPage({super.key});

  UserService userService = UserService();
  String accountId = '';
  String password = '';
  String rePassword = '';
  String name = '';

  void requestSignUp() async {
    var data = {'accountId': accountId, 'password': password, 'name': name};

    DioClient dioClient = DioClient();
    Response res = await dioClient.get('/userss');
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
                onChanged: (value) {
                  this.accountId = value;
                },
              ),
              InputTextWithLabel(
                label: '비밀번호',
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
                    onPressed: requestSignUp,
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
