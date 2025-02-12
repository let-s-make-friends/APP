import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/view/log_in.dart';
import 'package:gsm_certification_system/view/sign_up.dart';
import 'package:gsm_certification_system/view/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Pretendard",
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
      home: StartScreen(),
      getPages: [
        GetPage(name: '/start', page: () => StartScreen()),
        GetPage(name: '/login', page: () => LogInScreen(),transition: Transition.fade),
        GetPage(name: '/signup', page: () => SignUpScreen(),transition: Transition.fade),
      ],
    );
  }
}
