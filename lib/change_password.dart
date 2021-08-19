import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_in_as_member.dart';
import 'text_field.dart';
import 'more.dart';

class Changepassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => More())),
          ),
          backgroundColor: Color(0xFFF0233ad),
          title: const Text('AVT YuwaS', style: TextStyle(fontSize: 16),),
          actions: <Widget>[
            IconButton(icon: Icon(FontAwesomeIcons.bell, size: 22.sp,), onPressed: () {},),],
        ),
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
                inputtext(text: 'Old Password', ),
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
