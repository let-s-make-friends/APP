import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/view/activity_screen.dart';
import 'package:gsm_certification_system/view/log_in.dart';
import 'package:gsm_certification_system/view/main_screen.dart';
import 'package:gsm_certification_system/view/profile.dart';
import 'package:gsm_certification_system/view/reading_screen.dart';
import 'package:gsm_certification_system/view/sign_up.dart';
import 'package:gsm_certification_system/view/start.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: "Pretendard",
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
          home: MainScreen(),
          getPages: [
            GetPage(name: '/start', page: () => StartScreen()),
            GetPage(
                name: '/login',
                page: () => LogInScreen(),
                transition: Transition.fade),
            GetPage(
                name: '/signup',
                page: () => SignUpScreen(),
                transition: Transition.fade),
            GetPage(
                name: '/main',
                page: () => MainScreen(),
                transition: Transition.rightToLeft),
            GetPage(
                name: '/activity',
                page: () => ActivityScreen(),
                transition: Transition.rightToLeft),
            GetPage(
                name: '/profile',
                page: () => ProfileScreen(),
                transition: Transition.rightToLeft),
            GetPage(
                name: '/reading',
                page: () => ReadingScreen(),
                transition: Transition.rightToLeft),
          ],
        );
      },
    );
  }
}
