import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/controller/toggle_controller.dart';

import '../util/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToggleController toggleController = ToggleController();
    final List<Map<String, dynamic>> buttonStyles = [
      {
        'text': '점수',
        'score': '1234 점',
      },
      {
        'text': '독서마라톤',
        'score': '거북이코스',
      },
      {
        'text': 'TOEIC',
        'score': '515 점',
      },
      {
        'text': 'TOPCIT',
        'score': '115 점',
      },
    ];
    ColorData colorData = ColorData();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.account_circle,
                  size: 120.w,
                ),
              ),
              Center(
                child: Text(
                  '나현욱',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                height: 174.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2열
                    crossAxisSpacing: 12.w, // 열 간의 간격
                    mainAxisSpacing: 12.h, // 행 간의 간격
                    childAspectRatio: 2.2, // 가로 세로 비율
                  ),
                  itemCount: 4, // 총 아이템 수 (2열 2행)
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelected =
                          toggleController.selectedIndex.value == index;
                      return Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: OutlinedButton(
                          onPressed: () => toggleController.select(index),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: isSelected
                                  ? Color(colorData.mainColor)
                                  : Colors.grey,
                              width: 2.sp,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            buttonStyles[index]['text'],
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Color(colorData.mainColor)
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              Divider(),
              Expanded(
                child: Center(
                  child: Obx(() {
                    int selectedIndex = toggleController.selectedIndex.value;
                    return Text(
                      buttonStyles[selectedIndex]['score'],
                      style: TextStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(colorData.mainColor),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
