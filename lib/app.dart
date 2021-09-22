// @dart=2.9
import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'member_filter.dart';
import 'provider/provider.dart';
import 'splash_screen_1.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseServices.onMessage();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider()),
      ],
      child: ScreenUtilInit(
          builder: () => MaterialApp(debugShowCheckedModeBanner: false, home: Homescreen(),)),
    );
  }
}
