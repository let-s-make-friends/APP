import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsm_certification_system/util/background_button.dart';
import 'package:gsm_certification_system/util/page_move_button.dart';
import 'package:gsm_certification_system/util/text.dart';
import 'package:text_divider/text_divider.dart';
import '../util/color.dart';
import '../util/image.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // 임시
  final List<Map<String, dynamic>> rankings = [
    {
      'name': '김민준',
      'score': 2300,
    },
    {
      'name': '김블랙',
      'score': 2100,
    },
    {
      'name': '박지성',
      'score': 1500,
    },
    {
      'name': '손흥민',
      'score': 800,
    },
    {
      'name': '정우성',
      'score': 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    ColorData colorData = ColorData();
    ImageAssets image = ImageAssets();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText(text: 'GSM 인증제', size: 28.sp, family: 'chab'),
                    Image.asset(
                      image.profile,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  color: Color(colorData.gray1),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Text(
                      '랭킹 확인 🔥',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemExtent: 56.h,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rankings[index]['name'],
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            color: Color(colorData.gray2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            child: Text(
                              '${rankings[index]['score']}',
                              style:
                                  TextStyle(color: Color(colorData.mainColor)),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              TextDivider.horizontal(
                text: Text('작성하기'),
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Text(
                        '독서 영역 작성',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(colorData.mainColor),
                        width: 1,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Text(
                        '활동 영역 작성',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(colorData.mainColor),
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              PageMoveButton(text: '점수 계산 페이지로 이동', onTap: () {}),
              SizedBox(height: 24.h),
              PageMoveButton(text: '쓰기 예시 페이지로 이동', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
