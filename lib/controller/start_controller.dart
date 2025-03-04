import 'package:get/get.dart';

class StartController extends GetxController {
  void goToLogInScreen() {
    Get.toNamed('/login');
  }

  void goToSignUpScreen() {
    Get.toNamed('/signup');
  }
}
