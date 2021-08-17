import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'constants/palette.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';
import 'more.dart';

List<Widget>  _widgets =<Widget>[ Home(), About(), Contact(), More()];

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
    return SafeArea(
      child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF0233ad),
            title: const Text('AVT YuwaS',style: TextStyle(fontSize:16),),
            actions: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.bell,size:22.sp,),
                onPressed: () {},
              ),
            ],
          ),
        body: Column(
          children: [
            Expanded(
                child: IndexedStack(index: _currentIndex, children:_widgets,)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:Color(0xFFF0233ad),
          unselectedItemColor: Colors.white,

          onTap: (index){
            setState(() {
              _currentIndex =index;
            });
          },
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home,size: 22.sp,),
              label: 'HOME',
              backgroundColor: Color(0xFFF0233ad),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.users,size: 22.sp,),
              label: 'ABOUT',
              backgroundColor: Color(0xFFF0233ad),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.addressCard,size: 22.sp,),
              label: 'CONTACT',
              backgroundColor: Color(0xFFF0233ad),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz,size: 22.sp,),
              label: 'MORE',
              backgroundColor: Color(0xFFF0233ad),
            ),
          ],
          selectedItemColor: Colors.red,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
