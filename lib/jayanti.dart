import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pageroute.dart';
import 'year16-17.dart';

class Jayanti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void year1617() {
      Navigator.push(context, RotationRoute(Page: YearSixteen()));
    }

    var _moreitem = [
      Moreitem(
          iconleading: FontAwesomeIcons.calendar,
          title: 'Year 2016-17',
          icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: year1617),
      Moreitem(
        iconleading: FontAwesomeIcons.calendar,
        title: 'Year 2017-18',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: const Text(
          'AVT YuwaS',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bell,
              size: 22.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: _moreitem.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _moreitem[index];
          return ListTile(
            tileColor: Colors.black26,
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading: Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Icon(
                item.iconleading,
                color: Colors.white,
              ),
            ),
            title: Text(
              '${item.title}',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            trailing: Icon(
              item.icontrainel,
              color: Colors.white,
            ),
            focusColor: Colors.red,
            onTap: item.Callback,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.withOpacity(0.5),
            height: 0.8,
          );
        },
      ),
    );
  }
}

class Moreitem {
  final IconData? iconleading;
  final String? title;
  final IconData? icontrainel;
  final VoidCallback? Callback;

  const Moreitem(
      {Key,
      key,
      this.iconleading,
      this.title,
      this.icontrainel,
      this.Callback});
}
