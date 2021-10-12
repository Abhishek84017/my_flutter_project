import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/global.dart';
import '../../extensions/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
      if (value.text.isEmpty || value.text.length > 6) {
        Fluttertoast.showToast(msg: 'Otp cannot be impty');
        print(widget.otp);
        return;
      }
      var enterotp = int.parse(value.text);
      if (widget.otp != enterotp) {
        Fluttertoast.showToast(
            msg: 'Enterd Otp wrong', backgroundColor: Colors.red);
      } else {
        await kSharedPreferences?.setString('isGuest', 'true');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Homescreen()),
            (Route<dynamic> route) => false);
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
                  kimagelogo,
                  width: 180.h,
                  height: 180.h,
                  fit: BoxFit.fill,
                ),
              ),
              inputtext(
                  text: 'OTP',
                  controller: value,
                  keyboardtype: TextInputType.number),
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
