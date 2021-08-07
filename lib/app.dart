import 'package:avt_yuwas/sign_in_as_member.dart';
import 'package:avt_yuwas/splash_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignInAsMember(),
            ));
  }
}
