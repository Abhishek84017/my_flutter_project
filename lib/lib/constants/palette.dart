import 'package:flutter/material.dart';
// Applications Palette
class Palette {
  // Primary color swatches
  static const Map<int, Color> primaryColorSwatch = const {
    50: Color.fromRGBO(247, 202, 62, .1),
    100: Color.fromRGBO(247, 202, 62, .2),
    200: Color.fromRGBO(247, 202, 62, .3),
    300: Color.fromRGBO(247, 202, 62, .4),
    400: Color.fromRGBO(247, 202, 62, .5),
    500: Color.fromRGBO(247, 202, 62, .6),
    600: Color.fromRGBO(247, 202, 62, .7),
    700: Color.fromRGBO(247, 202, 62, .8),
    800: Color.fromRGBO(247, 202, 62, .9),
    900: Color.fromRGBO(247, 202, 62, 1),
  };

  // Primary color
  static const MaterialColor primaryColor = MaterialColor(0xFFF7CA3E, primaryColorSwatch);

  // Input background color
  static const Color signinmember = const Color(0xFFF0233ad);
  static const Color iconcolor = const Color(0xFFFffffff);

  //app bar color
  static const Color appbarcolor = const Color(0xFFF0233ad);

  static const Color Textcolor = const Color(0xFFF000000);

}