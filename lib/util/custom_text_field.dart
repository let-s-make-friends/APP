import 'package:flutter/material.dart';
import 'color.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;

  CustomTextField({
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
        Text(widget.labelText),
        Form(
          key: _formkey,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
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
