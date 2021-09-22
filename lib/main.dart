// @dart=2.9
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  // ensuring widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // ensure firebase initialization
  await Firebase.initializeApp();

  // ensure firebase services initialization
  await FirebaseServices.init();

  runApp(Myapp());
}
