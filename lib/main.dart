import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'app.dart';

void main() {
  runApp(Myapp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Palette.signinmember));
}
