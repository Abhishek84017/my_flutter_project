import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assests/images/bg.jpg'),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assests/images/logo.png',width:300.r,height:300.r, fit:BoxFit.fill,),
            Signinbutton(text: 'Sign in as Member', icon: Icons.lock_open, maincolor: Color(0xFFF0233ad)),
            Signinbutton(text: 'Continue as Guest', icon: Icons.person,),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Developed By\n'),
                    TextSpan(
                        text: 'Linksys Intelligence',
                        style: TextStyle(fontSize: 18.sp)),],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
