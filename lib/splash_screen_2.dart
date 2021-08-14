import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'chose_member.dart';

class Splashscreen2 extends StatefulWidget
{
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen2> {
  @override
  void initState()
  {
     super.initState();
     Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute( builder: (BuildContext context) {return Homepage();})));
  }
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/images/splash2.jpg'),fit:BoxFit.cover,
          )
        ),
    );
  }
}