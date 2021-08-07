import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInAsMember extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assests/images/bg.jpg'),fit: BoxFit.fill,)),
        child: Column(
          children: [
            Image.asset('assests/images/logo.png',width:200,height: 200,fit:BoxFit.fill,),
          ],
        ),
      ),
    );
  }
}
