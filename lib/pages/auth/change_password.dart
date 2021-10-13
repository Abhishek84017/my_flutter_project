import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/pages/widgets/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/global.dart';
import '../../extensions/text_field.dart';
import '../widgets/appbar.dart';

class Changepassword extends StatefulWidget {
  final String? id;
  final String? oldpassword;
  const Changepassword({this.id,this.oldpassword});
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  FocusNode focusNode = new FocusNode();
  TextEditingController _oldpassword =TextEditingController();
  TextEditingController _newpassword =TextEditingController();
  TextEditingController _changepassword =TextEditingController();

  void _passwordchange() async {
    focusNode.unfocus();
    if (_oldpassword.text.isEmpty || _newpassword.text.isEmpty || _changepassword.text.isEmpty) {
      Fluttertoast.showToast(msg: 'All fields are required', backgroundColor: Colors.red);
      return;
    }
    if(_oldpassword.text != widget.oldpassword)
      {
        Fluttertoast.showToast(msg: 'Please Enter valid old password', backgroundColor: Colors.red);
        return;
      }
    if(_newpassword.text != _changepassword.text)
      {
        Fluttertoast.showToast(msg: 'Password and Confirm password must be same', backgroundColor: Colors.red);
        return;
      }
    var data = <String, dynamic>{
      'member': widget.id,
      'password': _newpassword.text,
    };

    var response = await Services.changePassword(data);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'password change successfull');
      Navigator.pop(context,true);

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
                    kimagelogo,
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
                  focusNode:  focusNode,
                ),
                SizedBox(height: 10.h),
                Signinbutton(text: 'Change Password', maincolor: Color(0xFFF0233ad),Callback:_passwordchange,),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
