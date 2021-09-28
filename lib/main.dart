// @dart=2.9
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'constants/global.dart';

void main() async {
  // ensuring widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // ensure firebase initialization
  await Firebase.initializeApp();

  // ensure firebase services initialization
  await FirebaseServices.init();

  // initalize shared preferences
  kSharedPreferences = await SharedPreferences.getInstance();

  runApp(Myapp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFFF0233ad)));
}
