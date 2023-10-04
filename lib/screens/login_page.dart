import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/constants.dart';
import 'package:mind_control/providers/root_provider.dart';
import 'package:mind_control/screens/sign_up.dart';
import 'package:mind_control/components/primary_button.dart';
import 'package:mind_control/services/user_service.dart';
import 'package:mind_control/utils/dio_client.dart';
import 'package:mind_control/utils/loading.dart';
import 'package:mind_control/utils/show_dialog.dart';
import 'package:mind_control/utils/storage_client.dart';
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
  bool isKeepLogin = false;
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

    LoadingBar.show(context);
    String? token = await userService.login(accountId, password);
    if (!mounted) return;

    if (token == null) {
      LoadingBar.down(context);
      showDialog1(context, title: '로그인 실패', content: '일치하는 회원정보가 없습니다.');
      return;
    }

    if (isKeepLogin) {
      StorageClient.setToken(token);
      StorageClient.setIsKeepLogin(isKeepLogin);
    }

    LoadingBar.down(context);
    Provider.of<RootProvider>(context, listen: false)
        .updateIndexForPage(context, 0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    StorageClient.getIsKeepLogin().then((isKeepLoginP) async {
      if (!isKeepLoginP) return;
      final String token = await StorageClient.getToken() ?? '';
      if (!mounted) return;

      DioClient.setToken(token);
      Provider.of<RootProvider>(context, listen: false)
          .updateIndexForPage(context, 0);
    });

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
                    InkWell(
                      onTap: () {
                        setState(() {
                          isKeepLogin = !isKeepLogin;
                        });
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 3),
                        child: Row(children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: isKeepLogin,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  isKeepLogin = value!;
                                });
                              },
                            ),
                          ),
                          Text(
                            '  로그인 유지',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          )
                        ]),
                      ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  child: Text(
                    'version $appVersion',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
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
