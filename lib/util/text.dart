import 'dart:ffi';

import 'package:flutter/material.dart';

Widget titleText({
  required String text,
  required double size,
}) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'PottaOne', fontSize: size),
  );
}
