import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.labelText = '',
    this.hintText = '',
    required this.obscureText,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _formkey = GlobalKey<FormState>();
  ColorData colorData = ColorData();
  Color borderColor = Colors.grey[700]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isEmpty
            ? Container()
            : Text(
                widget.labelText,
                style: TextStyle(fontSize: 16.sp),
              ),
        Form(
          key: _formkey,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            obscuringCharacter: '●',
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(width: 1, color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(width: 1, color: borderColor),
              ),
            ),
            onChanged: (text) {
              setState(() {
                borderColor = text.isNotEmpty
                    ? Color(colorData.mainColor)
                    : Colors.green[100]!;
              });
            },
          ),
        ),
      ],
    );
  }
}
