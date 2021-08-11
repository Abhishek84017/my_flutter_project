import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/constants/palette.dart';

import 'constants/palette.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  _HomescreenState createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Colors.black));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color:Color(0xFFF0233ad),
              ),
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
                child: Row(
                  children: [
                    Text('AVT YuwaS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp),),
                    Spacer(),
                    IconButton(icon: Icon(Icons.notifications),color: Colors.white, onPressed: () {}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex =index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
            backgroundColor: Color(0xFFF0233ad),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Business',
            backgroundColor: Color(0xFFF0233ad),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_rounded),
            label: 'School',
            backgroundColor: Color(0xFFF0233ad),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Settings',
            backgroundColor: Color(0xFFF0233ad),
          ),
        ],
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
      ),
    );
  }
}
