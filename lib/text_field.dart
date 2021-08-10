import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputtext extends StatelessWidget {
  final String? text;
  final IconData? icon;

  const inputtext({Key, key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        cursorRadius: Radius.circular(100.0),
        cursorColor: Colors.white,
        decoration: InputDecoration(enabledBorder: UnderlineInputBorder(),
            prefixIcon: Icon(icon, color: Colors.white, size: 28.sp,),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}




