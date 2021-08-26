import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: size.width,
                  padding: EdgeInsets.all(20.h),
                  margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 0.1),
                  ),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(color: Colors.white,height:1.2.h,letterSpacing:0.3,fontSize:13.sp),
                      children: [
                        TextSpan(text: 'In 2005 Agrawal Vikas Trust Formed Youth wing called Agrawal Yuwa Shakha for betterment of Youth in society and to give Energy and Strength to Trust Activities. Basic Purpose behind YuwaS is to give Platform to all Talented Youth, To Engage Youth in Service to Society, to give Chance to represent Youth in Society, To Serve Society and Ultimately Serve Nation.\n'),
                        WidgetSpan(child: SizedBox(height:30.h,)),
                        TextSpan(text: 'We Agrawal Yuwa Shakha is a Social Organization actively engaged ourselves in Social Events throughout the year and also focus on overall development of an individual. We also focus in making an individual develop social responsible citizens who contribute locally, naturally and globally. We organize Blood Donation camps, Environment Awareness Programme, Anti-Tobacco Drive, and Drama based on Social Cause, talent shows and other activity to provide platform to Young talent.\n'),
                        WidgetSpan(child: SizedBox(height:30.h,)),
                        TextSpan(text: 'Around we develop Youth that is more efficient, More Valuable to Nation.\n'),
                        WidgetSpan(child: SizedBox(height:30.h,)),
                        TextSpan(text: 'We are here to Channelize Energy of Youth in Direction that is helpful to all. WE BELEIVE IN.\n'),
                        WidgetSpan(child: SizedBox(height:50.h,)),
                        TextSpan(text: '#ServeSoceity #ServeNation',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('Application Design By',textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontSize: 13.sp),),
                  ),
                  SizedBox(width:5,),
                  Text('Linksys Intelligence',style: TextStyle(color: Colors.blue,fontSize:12.sp),)
                ],
              ),

            ],
          ),
        ),
    );

  }
}
