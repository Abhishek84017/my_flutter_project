import 'package:avt_yuwas/more_webview.dart';
import 'package:avt_yuwas/provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'follow_us.dart';
import 'change_password.dart';
import 'commitedetails.dart';
import 'events.dart';
import 'Sports/sports_league.dart';
//ignore: must_be_immutable
class More extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    void info() {Provider.of<HomeScreenProvider>(context, listen: false).currentBottomIndex = 1;}
    void cont() {Provider.of<HomeScreenProvider>(context, listen: false).currentBottomIndex = 2;}
    void passchange() {Navigator.push(context, MaterialPageRoute(builder: (_) => Changepassword()));}
    void follow() {Navigator.push(context, MaterialPageRoute(builder: (_) => Followus()));}
    void committedetails() {Navigator.push(context, MaterialPageRoute(builder: (_) => Commiteedetails()));}
    void events() {Navigator.push(context, MaterialPageRoute(builder: (_) => Events()));}
    void maharaja_agrasen_jayanti(){Navigator.push(context, MaterialPageRoute(builder: (_) => MoreWebview(title:'Maharaja Agrasen Jayanti',url:'http://www.avtyuwas.org/home/jayanti_events')));}
    void sportsleague() {Navigator.push(context, MaterialPageRoute(builder: (_) => SportsLeague()));}
    var _moreitem = [
      Moreitem(
        iconleading: FontAwesomeIcons.calendarPlus,
        title: 'Maharaja Agrasen Jayanti',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: maharaja_agrasen_jayanti
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.userCircle,
        title: 'My Profile',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
          iconleading: FontAwesomeIcons.infoCircle,
          title: 'About Us',
          icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: info
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.usersCog,
        title: 'Committee Details',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: committedetails
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.calendarAlt,
        title: 'Calender',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.users,
        title: 'Members',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.calendarWeek,
        title: 'Events',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: events
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.handshake,
        title: 'Meeting Updates',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.crown,
        title: 'Maharaja Agarsen Jayanti',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.gift,
        title: 'Birthday & Anniversary',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.portrait,
        title: 'Selfie Corner',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.camera,
        title: 'Media Corner',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.running,
        title: 'Sports League',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: sportsleague
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.trophy,
        title: 'Achivements',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.bell,
        title: 'Notifications',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
          iconleading: FontAwesomeIcons.userMd,
          title: 'Suggestion',
          icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: info
      ),
      Moreitem(
          iconleading: FontAwesomeIcons.addressBook,
          title: 'Contact Us',
          icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: cont
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.userTie,
        title: 'Follow Us',
        icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: follow
      ),
      Moreitem(
          iconleading: FontAwesomeIcons.key,
          title: 'Change Password',
          icontrainel: Icons.arrow_forward_ios_rounded,
          Callback: passchange
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.signOutAlt,
        title: 'LogOut',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.separated(
        shrinkWrap: true,
        dragStartBehavior: DragStartBehavior.start,
        itemCount: _moreitem.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _moreitem[index];
          return ListTile(
            dense: true,
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
              style: TextStyle(color: Colors.white,fontSize:14),
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
  const Moreitem({Key, key, this.iconleading, this.title, this.icontrainel, this.Callback});
}
