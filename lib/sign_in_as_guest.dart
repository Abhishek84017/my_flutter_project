import 'package:avt_yuwas/sign_in_as_member.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_field.dart';
class SignInAsGuest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    void signinmember() {
      Navigator.push(context,MaterialPageRoute(builder:(_)=>SignInAsMember()));
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tight(size),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assests/images/bg.jpg',),fit: BoxFit.fill,)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Image.asset('assests/images/logo.png',width:180.h,height: 180.h,fit:BoxFit.fill,),
              ),
              inputtext(text: 'NAME', icon: Icons.person,),
              SizedBox(height:10.h),
              inputtext(text: 'E-MAIL', icon: Icons.mail,),
              SizedBox(height:20.h),
              inputtext(text: 'MOBILE', icon: Icons.mobile_friendly_sharp,),
              SizedBox(height:10.h),
              Signinbutton(text: 'Next', maincolor: Color(0xFFF0233ad)),
              Signinbutton(text: 'Sign in as Member',icon: Icons.lock_open,maincolor:Colors.blue,Callback:signinmember,),
            ],
          ),
        ),
      ),
    );
  }

}
