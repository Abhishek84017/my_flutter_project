import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'constants/global.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';
import 'more.dart';
import 'provider/provider.dart';
import 'appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/user_provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> _widgets = <Widget>[Home(), About(), Contact(), More()];

  @override
  void initState() {
    kUserProvider = Provider.of<UserProvider>(context, listen: false);
    kUserProvider?.init();
    kUserProvider?.sync();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    super.initState();
  }

  Future<bool> _onbackpress() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Do you want to exit'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          'no',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () async {
                          kSharedPreferences?.remove('mobile');
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          'Yes',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        )),
                  ],
                )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onbackpress,
      child: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) => SafeArea(
          child: Scaffold(
            appBar: appBar(
                context: context,
                title: 'Avt Yuwas',
                automaticallyImplyLeading: false),
            body: Column(
              children: [
                Expanded(
                    child: IndexedStack(
                  index: provider.currentBottomIndex,
                  children: _widgets,
                )),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFFF0233ad),
              unselectedItemColor: Colors.white,
              onTap: (index) {
                provider.currentBottomIndex = index;
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    size: 22.sp,
                  ),
                  label: 'HOME',
                  backgroundColor: Color(0xFFF0233ad),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.users,
                    size: 22.sp,
                  ),
                  label: 'ABOUT',
                  backgroundColor: Color(0xFFF0233ad),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.addressCard,
                    size: 22.sp,
                  ),
                  label: 'CONTACT',
                  backgroundColor: Color(0xFFF0233ad),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 22.sp,
                  ),
                  label: 'MORE',
                  backgroundColor: Color(0xFFF0233ad),
                ),
              ],
              selectedItemColor: Colors.red,
              currentIndex: provider.currentBottomIndex,
            ),
          ),
        ),
      ),
    );
  }
}
