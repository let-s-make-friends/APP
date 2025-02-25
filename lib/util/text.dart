import 'package:flutter/material.dart';

Widget titleText({
  required String text,
  required double size,
  required String family,
}) {
  return Text(
    text,
    style: TextStyle(fontFamily: '$family', fontSize: size),
  );
}
