import 'package:flutter/material.dart';

import '../util/color.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key, required this.buttonText, required this.onButtonPressed});

  final String buttonText;
  final Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    ColorData colorData = ColorData();
    Size size = MediaQuery.of(context).size;
    return OutlinedButton(
      onPressed: onButtonPressed,
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Color(colorData.mainColor),
            width: 1,
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0),
          maximumSize: Size(size.width, 60),
          minimumSize: Size(size.width, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        buttonText,
        style: TextStyle(
            color: Color(colorData.mainColor), fontWeight: FontWeight.w600),
      ),
    );
  }
}
