// @dart=2.9
import 'dart:convert';
import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/provider/user_provider.dart';
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'constants/global.dart';
import 'forget_password.dart';
import 'extensions/text_field.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'pageroute.dart';

class SignInAsMember extends StatefulWidget {
  @override
  _SignInAsMemberState createState() => _SignInAsMemberState();
}

class _SignInAsMemberState extends State<SignInAsMember> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String _token;

  void _singinmember() async {
    var data = <String, dynamic>{
      'username': _username.text,
      'password': _password.text,
      'token': _token ?? '',
    };

    var responce = await Services.SigninMember(data);

    if (responce.statusCode == 200) {
      if (responce?.data?.status == 1) {
        await kSharedPreferences.setString(
            'userdata', jsonEncode(responce.data.toJson()));
        await kSharedPreferences.setString('data', 'true');
        kUserProvider.init();
        Navigator.pushReplacement(context, RotationRoute(Page: Homescreen()));
      } else {
        Fluttertoast.showToast(
            msg: 'Username or password wrong', backgroundColor: Colors.red);
      }
    } else {
      print(responce.message);
    }
  }

  @override
  void initState() {
    kUserProvider = Provider.of<UserProvider>(context, listen: false);
    _initToken();
    super.initState();
  }

  void _initToken() async {
    _token = await FirebaseServices.getFcmToken();
  }

  @override
  Widget build(BuildContext context) {
    // void forgetpassword() {
    //    Navigator.pushReplacement(context,CupertinoPageRoute(builder:(_)=>SignInAsMember()));
    //  }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tight(size),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assests/images/bg.jpg'),
            fit: BoxFit.fill,
          )),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Image.asset(
                  kimagelogo,
                  width: 180.h,
                  height: 180.h,
                  fit: BoxFit.fill,
                ),
              ),
              inputtext(
                  text: 'Username',
                  icon: Icons.person,
                  controller: _username,
                  onEditingComplete: () => FocusScope.of(context).nextFocus()),
              inputtext(
                  text: 'Password',
                  icon: Icons.lock,
                  controller: _password,
                  onEditingComplete: () => FocusScope.of(context).unfocus()),
              Signinbutton(
                text: 'Sign In ',
                maincolor: Color(0xFFF0233ad),
                Callback: _singinmember,
              ),
              GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {return Forgetpassword();}));
                    Navigator.push(
                        context, RotationRoute(Page: Forgetpassword()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
