// @dart=2.9
import 'package:avt_yuwas/models/signinguest.dart';
import 'package:avt_yuwas/otp.dart';
import 'package:avt_yuwas/services/notification_services.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/sign_in_as_member.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'extensions/text_field.dart';
import 'pageroute.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avt_yuwas/constants/validate.dart';

class SignInAsGuest extends StatefulWidget {
  @override
  _SignInAsGuestState createState() => _SignInAsGuestState();
}

class _SignInAsGuestState extends State<SignInAsGuest> {
  TextEditingController _name = TextEditingController();
  TextEditingController _mail = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  SignInGuestModel GuestSignin = SignInGuestModel();
  String _token;

  void _guestsingin() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString('mobile', _mobile.text);

    if (_name.text.isEmpty || _mail.text.isEmpty || _mobile.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All fields are required', backgroundColor: Colors.red);
      return;
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_mail.text)) {
      Fluttertoast.showToast(
          msg: 'Invalid email id', backgroundColor: Colors.red);
      return;
    }
    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(_mobile.text)) {
      Fluttertoast.showToast(
          msg: 'Invalid mobile number', backgroundColor: Colors.red);
      return;
    }
    var data = <String, dynamic>{
      'name': _name.text,
      'email': _mail.text,
      'mobile': _mobile.text,
      'token': _token ?? ''
    };
    var response = await Services.SignUpGeste(data);
    if (response.statusCode == 200) {
      GuestSignin = response.data;
      Navigator.pushReplacement(
          context, RotationRoute(Page: Otp(otp: GuestSignin?.otp)));
      setState(() {});
    } else {
      print(response.message);
    }
  }

  @override
  void initState() {
    _initToken();
    super.initState();
  }

  void _initToken() async {
    _token = await FirebaseServices.getFcmToken();
  }

  @override
  Widget build(BuildContext context) {
    void signinmember() {
      Navigator.pushReplacement(context, RotationRoute(Page: SignInAsMember()));
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tight(size),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assests/images/bg.jpg',
                ),
                fit: BoxFit.fill,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assests/images/logo.png',
                  width: 180.h,
                  height: 180.h,
                  fit: BoxFit.fill,
                ),
              ),
              inputtext(
                text: 'NAME',
                icon: Icons.person,
                controller: _name,
              ),
              SizedBox(height: 10.h),
              inputtext(
                text: 'E-MAIL',
                icon: Icons.mail,
                controller: _mail,
              ),
              SizedBox(height: 20.h),
              inputtext(
                text: 'MOBILE',
                icon: Icons.mobile_friendly_sharp,
                controller: _mobile,
              ),
              SizedBox(height: 10.h),
              Signinbutton(
                text: 'Next',
                maincolor: Color(0xFFF0233ad),
                Callback: () {
                  _guestsingin();
                },
              ),
              Signinbutton(
                text: 'Sign in as Member',
                icon: Icons.lock_open,
                maincolor: Colors.blue,
                Callback: signinmember,
              ),
            ],
          ),
        ),
      ),
    );
  }
}