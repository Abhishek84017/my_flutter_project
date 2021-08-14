import 'dart:async';
import 'package:avt_yuwas/splash_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Splashscreen1 extends StatefulWidget
{
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen1> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute( builder: (BuildContext context) {return Splashscreen2();})));
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/images/splash1.jpg'),fit:BoxFit.cover,

          )
      ),
    );
  }
}