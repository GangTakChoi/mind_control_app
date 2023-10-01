import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/providers/root_provider.dart';
import 'package:mind_control/screens/sign_up.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/services/user_service.dart';
import 'package:mind_control/utils/show_dialog.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String accountId = '';
  String password = '';
  String appVersion = '';
  UserService userService = UserService();

  void login() async {
    if (accountId.isEmpty) {
      showDialog1(context, title: '아이디 미입력', content: '아이디를 입력해주세요.');
      return;
    }
    if (password.isEmpty) {
      showDialog1(context, title: '패스워드 미입력', content: '패스워드를 입력해주세요.');
      return;
    }

    String? token = await userService.login(accountId, password);

    if (token == null) {
      if (!mounted) return;
      showDialog1(context, title: '로그인 실패', content: '일치하는 회원정보가 없습니다.');
      return;
    }

    if (!mounted) return;
    Provider.of<RootProvider>(context, listen: false)
        .updateIndexForPage(context, 0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        appVersion = packageInfo.version;
      });
    });
  }

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
            mainAxisSize: MainAxisSize.max,
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
                      '하루의 기록 앱을 이용해주셔서 감사합니다.',
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
                      onChanged: (value) {
                        accountId = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    PrimaryButton(
                      title: '로그인',
                      onPressed: () async {
                        login();
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
              Expanded(child: SizedBox()),
              SizedBox(
                child: Text(
                  'version $appVersion',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              )
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
