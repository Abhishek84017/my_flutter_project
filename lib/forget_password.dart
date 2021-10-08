import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants/global.dart';
import 'sign_in_as_member.dart';
import 'extensions/text_field.dart';

class Forgetpassword extends StatefulWidget {
  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController _forgettext = TextEditingController();

  void _passwordforget() async {
    if (_forgettext.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All fields are required', backgroundColor: Colors.red);
      return;
    }
    var response = await Services.forgetPassword(_forgettext.text);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: '${response.message}', backgroundColor: Colors.red);
      if (response.message == 'Password has been sent to your mobile') {
        Navigator.pop(context, true);
      }
    } else {
      print(response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.fill,
                ),
              ),
              inputtext(
                text: 'USERNAME or MOBILE',
                icon: Icons.person,
                controller: _forgettext,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                keyboardtype: TextInputType.number,
              ),
              SizedBox(height: 10.h),
              Signinbutton(
                  text: 'Get Password',
                  maincolor: Color(0xFFF0233ad),
                  Callback: _passwordforget),
              SizedBox(height: 15.h),
              GestureDetector(
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SignInAsMember();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
