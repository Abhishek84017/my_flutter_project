// @dart=2.9
import 'package:avt_yuwas/provider/user_provider.dart';
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
      ],
      child: ScreenUtilInit(
          builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Splashscreen1(),
              )
          ),
    );
  }
}
