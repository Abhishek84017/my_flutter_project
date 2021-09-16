import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/data_model.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'extensions/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  final int? otp;

  Otp({this.otp});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void login() async {

      print(widget.otp);
      if (value.text.isEmpty || value.text.length > 6) {
        Fluttertoast.showToast(msg: 'Otp cannot be impty');
        return;
      }
      var enterotp = int.parse(value.text);
      if (widget.otp != enterotp) {
        Fluttertoast.showToast(
            msg: 'Enterd Otp wrong', backgroundColor: Colors.red);
      } else {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
         await  sharedPreferences.setBool('isGuest', true);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Homescreen()), (Route<dynamic> route) => false);
      }
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
              inputtext(text: 'OTP', controller: value),
              SizedBox(height: 10.h),
              Signinbutton(
                text: 'Verify',
                maincolor: Colors.blue,
                Callback: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
