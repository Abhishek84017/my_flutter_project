import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'extensions/text_field.dart';
import 'appbar.dart';

class Changepassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar:appBar(context: context,title:'Avt Yuwas',automaticallyImplyLeading: true),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.tight(size),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assests/images/bg.jpg',),fit: BoxFit.fill,)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Image.asset('assests/images/logo.png',width:200.w,height: 200.h,fit:BoxFit.fill,),
                ),
                inputtext(text: 'Old Password',),
                inputtext(text: 'New Password', ),
                inputtext(text: 'Confirm Password', ),
                SizedBox(height:10.h),
                Signinbutton(text: 'Change Password', maincolor: Color(0xFFF0233ad)),
                SizedBox(height:15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
