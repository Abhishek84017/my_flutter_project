import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'forget_password.dart';
import 'extensions/text_field.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/models/signinmemberModel.dart';


class SignInAsMember extends StatefulWidget{
  @override
  _SignInAsMemberState createState() => _SignInAsMemberState();
}

class _SignInAsMemberState extends State<SignInAsMember> {
  TextEditingController _username =TextEditingController();
  TextEditingController _password =TextEditingController();
  SignIn? MemberSingIn = SignIn();

  void _Singinmember() async {
    var data=<String,dynamic>
    {
      'username':_username.text,
      'password':_password.text,
      'token':'asdfasdfasdfasdfasdfasdf',
    };
    var responce= await Services.SigninMember(data);
    if(responce.statusCode ==200)
      {
          MemberSingIn= responce.data;
          print(MemberSingIn);
          setState(() {});
      }
    else
      {
        print(responce.message);
      }
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
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assests/images/bg.jpg'),fit: BoxFit.fill,)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Image.asset('assests/images/logo.png',width:180.h,height:180.h,fit:BoxFit.fill,),
              ),
              inputtext(text: 'Username', icon: Icons.person, controller: _username,),
              SizedBox(height:10.h),
              inputtext(text: 'Password', icon: Icons.lock,controller: _password,),
              SizedBox(height:20.h),
              Signinbutton(text: 'Sign In ', maincolor: Color(0xFFF0233ad), Callback:_Singinmember,),
              SizedBox(height:15.h),
             GestureDetector(
                 child: Text('forget password?',style: TextStyle(color: Colors.white,fontSize:16.sp,decoration:TextDecoration.underline ),),
                 onTap: () {Navigator.push(context,MaterialPageRoute( builder: (BuildContext context) {return Forgetpassword();}));}
             ),
            ],
          ),
        ),
      ),
    );
  }


}
