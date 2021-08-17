import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//ignore: must_be_immutable
class More extends StatelessWidget {
  var _moreitem = [
    Moreitem(
       iconleading:FontAwesomeIcons.calendarPlus,
      title: 'Maharaja Agrasen Jayanti',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.userCircle,
      title: 'My Profile',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.infoCircle,
      title: 'About Us',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.usersCog,
      title: 'Committee Details',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.calendarAlt,
      title: 'Calender',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.users,
      title: 'Members',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.calendarWeek,
      title: 'Events',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.handshake,
      title: 'Meeting Updates',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.crown,
      title: 'Maharaja Agarsen Jayanti',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.gift,
      title: 'Birthday & Anniversary',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.portrait,
      title: 'Selfie Corner',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.camera,
      title: 'Media Corner',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.running,
      title: 'Sports League',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.trophy,
      title: 'Achivements',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.bell,
      title: 'Notifications',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.userMd,
      title: 'Suggestion',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.addressBook,
      title: 'Contact Us',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.userTie,
      title: 'Follow Us',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.key,
      title: 'Change Password',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
       iconleading:FontAwesomeIcons.signOutAlt,
      title: 'LogOut',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          dragStartBehavior: DragStartBehavior.start,
          itemCount: _moreitem.length,
          itemBuilder: (BuildContext context, int index) {
            var item = _moreitem[index];
            return Card(
              child: ListTile(
                leading: Icon(item. iconleading,),
                title: Text('${item.title}'),
                trailing: Icon(item.icontrainel),
              ),
            );
          }),
    );
  }
}
class Moreitem {
  final IconData? iconleading;
  final String? title;
  final IconData? icontrainel;
  const Moreitem({this.iconleading, this.title, this.icontrainel});
}
