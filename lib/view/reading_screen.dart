import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/util/custom_text_field.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    '독서 영역 작성',
                    style:
                        TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
