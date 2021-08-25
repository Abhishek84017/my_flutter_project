import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'package:provider/provider.dart';
import 'constants/palette.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';
import 'more.dart';
import 'provider/provider.dart';

List<Widget> _widgets = <Widget>[Home(), About(), Contact(), More()];

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFF0233ad),
            title: const Text('AVT YuwaS', style: TextStyle(fontSize: 20),),
            actions: <Widget>[
              IconButton(icon: Icon(FontAwesomeIcons.bell, size: 22.sp,), onPressed: () {},),],
          ),
          body: Column(
            children: [
              Expanded(child: IndexedStack(index: provider.currentBottomIndex, children: _widgets,)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFFF0233ad),
            unselectedItemColor: Colors.white,
            onTap: (index) {provider.currentBottomIndex = index;},
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home, size: 22.sp,),
                label: 'HOME',
                backgroundColor: Color(0xFFF0233ad),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.users, size: 22.sp,),
                label: 'ABOUT',
                backgroundColor: Color(0xFFF0233ad),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.addressCard, size: 22.sp,),
                label: 'CONTACT',
                backgroundColor: Color(0xFFF0233ad),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz, size: 22.sp,),
                label: 'MORE',
                backgroundColor: Color(0xFFF0233ad),
              ),
            ],
            selectedItemColor: Colors.red,
            currentIndex: provider.currentBottomIndex,
          ),
        ),
      ),
    );
  }
}
