import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/constants/palette.dart';
class Signinbutton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color?  maincolor;
   const Signinbutton ({Key ,key, this.text, this.icon, this.maincolor}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // color: Palette.signinmember,
           color: text == 'Sign in as Member' ? maincolor : Colors.blue,
          ),
      child: TextButton(
        onPressed: () {},
        child: Row(children: [
            Icon(icon, color:Palette.iconcolor,size:28,),
            Expanded(
                child: Align(alignment: Alignment.center,
                    child: Text(
                      text!, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
