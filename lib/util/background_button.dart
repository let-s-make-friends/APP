import 'package:flutter/material.dart';
import '../util/color.dart';

class BackgroundButton extends StatelessWidget {
  final String buttonText;
  final Function() onButtonPressed;

  const BackgroundButton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    ColorData colorData = ColorData();
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed:onButtonPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(colorData.mainColor),
          padding: EdgeInsets.symmetric(vertical: 20.0),
          maximumSize: Size(size.width, 60),
          minimumSize: Size(size.width, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
