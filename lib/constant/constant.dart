import 'package:flutter/material.dart';

Color bgcolor = Colors.grey[900]!;
Color kgreyColor = Colors.grey;
Color kGreenColor = Colors.green;
Color kRedColor = Colors.red;

const primaryGradient = LinearGradient(colors: [
  Color.fromARGB(255, 102, 178, 240),
  Color.fromARGB(255, 121, 232, 221)
]);

TextStyle normalText({double? size, Color? color}) {
  return TextStyle(color: color, fontSize: size, fontFamily: 'Poppins_regular');
}

TextStyle boldText({double? size, Color? color}) {
  return TextStyle(color: color, fontSize: size, fontFamily: 'Poppins_bold');
}

TextStyle semiBoldText({double? size, Color? color}) {
  return TextStyle(
      color: color, fontSize: size, fontFamily: 'Poppins_semibold');
}
