import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/view/log_in.dart';
import 'package:gsm_certification_system/view/main_screen.dart';
import 'package:gsm_certification_system/view/signUp/sign_up_check_number.dart';
import 'package:gsm_certification_system/view/signUp/sign_up_password.dart';
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
                name: '/signupCheckNumber',
                page: () => SignUpScreen(),
                transition: Transition.fade),
            GetPage(
                name: '/signupPassword',
                page: () => SignUpPassword(),
                transition: Transition.rightToLeft),
          ],
        );
      },
    );
  }
}
