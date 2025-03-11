import 'package:get/get.dart';

class ToggleController extends GetxController {
  var selectedIndex = 0.obs; // 기본값: 첫 번째 버튼이 선택됨

  void select(int index) {
    selectedIndex.value = index; // 새로운 버튼 선택 (해제 불가)
  }
}
