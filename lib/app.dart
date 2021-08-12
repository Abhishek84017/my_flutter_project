import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'about.dart';


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              home:About(),
            ));
  }
}
