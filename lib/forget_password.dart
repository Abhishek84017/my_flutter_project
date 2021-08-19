import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sign_in_as_member.dart';
import 'text_field.dart';

class Forgetpassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset('assests/images/logo.png',width:200.w,height: 200.h,fit:BoxFit.fill,),
              ),
              inputtext(text: 'USERNAME or MOBILE', icon: Icons.person,),
              SizedBox(height:10.h),
              Signinbutton(text: 'Get Password', maincolor: Color(0xFFF0233ad)),
              SizedBox(height:15.h),
              GestureDetector(
                  child: Text('Back to Login',style: TextStyle(color: Colors.white,fontSize:16.sp,decoration: TextDecoration.underline),),
                  onTap: () {Navigator.push(context,MaterialPageRoute( builder: (BuildContext context) {return SignInAsMember();}));}
              ),
            ],
          ),
        ),
      ),
    );
  }
}