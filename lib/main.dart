import 'package:flutter/material.dart';
import 'package:mind_control/providers/root_provider.dart';
import 'package:mind_control/providers/write_day_provider.dart';
import 'package:mind_control/screens/more_page.dart';
import 'package:mind_control/screens/privacy_page.dart';
import 'package:mind_control/screens/terms_page.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'screens/login_page.dart';
import 'package:mind_control/screens/sign_up.dart';
import 'package:mind_control/screens/view_days_page.dart';
import 'package:mind_control/screens/goal_mgmt_page.dart';
import 'constants.dart';
import 'screens/write_day_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WriteDayProvider()),
        ChangeNotifierProvider(create: (context) => RootProvider())
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16.0)),
          primarySwatch: buildMaterialColor(Color(0xff999CEE)),
        ),
        home: LoginPage(),
        // home: SignUpPage(),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          WriteDayPage.id: (context) => WriteDayPage(),
          ViewDaysPage.id: (context) => ViewDaysPage(),
          GoalMgmtPage.id: (context) => GoalMgmtPage(),
          MorePage.id: (context) => MorePage(),
          PrivacyPage.id: (context) => PrivacyPage(),
          TermsPage.id: (context) => TermsPage()
        },
      ),
    );
  }
}
