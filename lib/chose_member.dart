import 'package:avt_yuwas/sign_in_as_guest.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pageroute.dart';
import 'sign_in_as_member.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void Signinmember() {
      Navigator.push(context, RotationRoute(Page: SignInAsMember()));
    }
    void Signinguest() {
      Navigator.push(context, RotationRoute(Page: SignInAsGuest()));
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assests/images/bg.jpg'),
          fit: BoxFit.fill,
        )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Image.asset('assests/images/logo.png',
                width: 200.r,
                height: 200.r,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 0.2.sh,
            ),
            Signinbutton(
              text: 'Sign in as Member',
              icon: Icons.lock_open,
              maincolor: Color(
                0xFFF0233ad,
              ),
              Callback: Signinmember,
            ),
            Signinbutton(
              text: 'Continue as Guest',
              icon: Icons.person,
              Callback: Signinguest,
            ),
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
                        style: TextStyle(fontSize: 18.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
