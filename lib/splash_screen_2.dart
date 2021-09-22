import 'dart:async';
import 'package:avt_yuwas/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chose_member.dart';
import 'pageroute.dart';

String? FinalMobile;

class Splashscreen2 extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen2> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, RotationRoute(Page: Homepage())));
    getValidationData().whenComplete(()async{
      Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context,(FinalMobile == null ? RotationRoute(Page: Homepage()) : RotationRoute(Page: Homescreen()))));
    });
  }

  Future getValidationData() async
  {
    final SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    var obtainedMobile=  sharedPreferences.getString('mobile');
      setState(() {
      FinalMobile = obtainedMobile;
    });

  }


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assests/images/splash2.jpg'),
        fit: BoxFit.fill,
      )),
    );
  }
}
