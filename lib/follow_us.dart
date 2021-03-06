import 'package:avt_yuwas/constants/global.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'appbar.dart';

class Followus extends StatelessWidget {
  var url = 'https://www.instagram.com/singh_akku2855/';
  var facebookurl = 'https://www.facebook.com/';
  var youtubeurl = 'https://www.youtube.com/';
  var twitterurl = 'https://www.twitter.com/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            context: context,
            title: 'Follow Us',
            automaticallyImplyLeading: true),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(kimagelogo,
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Follow Us On Social Media',
                style: TextStyle(
                    color: Palette.Textcolor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () async {
                              if (await canLaunch(url)) {
                                await launch(url);
                              }
                            },
                            child: Image(
                              image: AssetImage(
                                  'assests/images/socialinstagram.png'),
                              height: 100,
                            )),
                        InkWell(
                            onTap: () async {
                              if (await canLaunch(facebookurl)) {
                                await launch(facebookurl);
                              }
                            },
                            child: Image(
                              image: AssetImage(
                                  'assests/images/socialfacebook.png'),
                              height: 100,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Instagram',
                          style: TextStyle(color: Palette.Textcolor, fontSize: 18.sp),
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(color: Palette.Textcolor, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () async {
                              if (await canLaunch(youtubeurl)) {
                                await launch(youtubeurl);
                              }
                            },
                            child: Image(
                              image: AssetImage(
                                  'assests/images/socialyoutube.png'),
                              height: 100,
                            )),
                        InkWell(
                            onTap: () async {
                              if (await canLaunch(twitterurl)) {
                                await launch(twitterurl);
                              }
                            },
                            child: Image(
                              image: AssetImage(
                                  'assests/images/socialtwitter.png'),
                              height: 100,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Instagram',
                          style: TextStyle(color: Palette.Textcolor, fontSize: 18.sp),
                        ),
                        Text(
                          'twitter',
                          style: TextStyle(color: Palette.Textcolor, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
