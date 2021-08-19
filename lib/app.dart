import 'package:avt_yuwas/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider()),
      ],
      child: ScreenUtilInit(
          builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Homescreen(),
              )),
    );
  }
}
