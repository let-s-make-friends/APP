import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/color.dart';

class PageMoveButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  PageMoveButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final ColorData colorData = ColorData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        width: MediaQuery.of(context).size.width,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Color(colorData.gray2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
