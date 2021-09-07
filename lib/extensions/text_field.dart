import 'package:avt_yuwas/constants/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputtext extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final TextEditingController? controller;
  final Validator? validator;
  const inputtext({Key, key, this.text, this.icon, this.controller, this.validator}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: TextFormField(
        controller: controller,
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
