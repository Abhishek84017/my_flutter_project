import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'extensions/text_field.dart';
import 'appbar.dart';

class Changepassword extends StatefulWidget {
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController _oldpassword =TextEditingController();
  TextEditingController _newpassword =TextEditingController();
  TextEditingController _changepassword =TextEditingController();

  void _guestsingin() async {
    if (_oldpassword.text.isEmpty || _newpassword.text.isEmpty || _changepassword.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All fields are required', backgroundColor: Colors.red);
      return;
    }
    var data = <String, dynamic>{
      // 'member': _name.text,
      'password': _changepassword.text,
    };

    var response = await Services.changePassword(data);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'password change successfull');
      setState(() {});
    } else {
      print(response.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            context: context,
            title: 'Avt Yuwas',
            automaticallyImplyLeading: true),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assests/images/logo.png',
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.fill,
                  ),
                ),
                inputtext(
                  text: 'Old Password',
                  icon: Icons.lock,
                  controller: _oldpassword,
                ),
                inputtext(
                  text: 'New Password',
                  icon: Icons.lock,
                  controller: _newpassword,
                ),
                inputtext(
                  text: 'Confirm Password',
                  icon: Icons.lock,
                  controller: _changepassword,
                ),
                SizedBox(height: 10.h),
                Signinbutton(text: 'Change Password', maincolor: Color(0xFFF0233ad),Callback:_guestsingin,),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
