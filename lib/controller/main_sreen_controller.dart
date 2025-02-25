import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var rankings = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchRankings();
    super.onInit();
  }

  void fetchRankings() {
    rankings.value = [
      {'name': '김민준', 'score': 2300},
      {'name': '김블랙', 'score': 2100},
      {'name': '박지성', 'score': 1500},
      {'name': '손흥민', 'score': 800},
      {'name': '정우성', 'score': 100},
    ];
  }

  Future<void> refreshRankings() async {
    await Future.delayed(Duration(seconds: 1)); // API 호출 시뮬레이션
    rankings.shuffle(); // 데이터를 랜덤하게 섞어 새로고침 효과를 줌
  }
}
