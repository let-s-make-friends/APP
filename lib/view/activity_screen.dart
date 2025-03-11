import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '활동 영역',
                    style:
                        TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              buildDropdown("카테고리", ["인문", "전공"]),
              SizedBox(height: 16.h),
              buildDropdown("카테고리 2", ['교내 수상', '교외']),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDropdown(String label, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 14.w, color: Colors.grey)),
      SizedBox(height: 4.h),
      DropdownButtonFormField2<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Color(0xFF588C73),
          ),
          // 🔹 아이콘 변경
          openMenuIcon: const Icon(
            Icons.keyboard_arrow_up_sharp,
            color: Color(0xFF588C73),
          ), // 🔹 열린 상태 아이콘 변경
        ),
        isExpanded: true,
        items: options
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) {},
      ),
    ],
  );
}
