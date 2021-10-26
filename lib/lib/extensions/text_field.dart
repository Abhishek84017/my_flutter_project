
import 'package:avt_yuwas/constants/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class inputtext extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final TextEditingController? controller;
  final Validator? validator;
  final TextInputType? keyboardtype;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;



  const inputtext(
      {Key,
      key,
      this.text,
      this.icon,
      this.controller,
      this.validator,
      this.keyboardtype,
      this.onEditingComplete,
      this.focusNode,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.0.w,vertical:15.0.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardtype,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        cursorRadius: Radius.circular(100.0),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
              size: 28.sp,
            ),
            hintText: text,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
