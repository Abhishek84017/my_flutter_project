import 'package:avt_yuwas/more_webview.dart';
import 'package:avt_yuwas/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'follow_us.dart';
import 'change_password.dart';
import 'commitedetails.dart';
import 'events.dart';
import 'Sports/sports_league.dart';
import 'pageroute.dart';
import 'jayanti.dart';
//ignore: must_be_immutable
class More extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    void Maharaja_agrasen_jayanti(){Navigator.push(context, RotationRoute( Page:MoreWebview(title:'Maharaja Agrasen Jayanti',url:'http://www.avtyuwas.org/home/jayanti_events',),));}
    void Metting_update(){Navigator.push(context, RotationRoute(Page:MoreWebview(title:'Meeting Update',url:'http://www.avtyuwas.org/web/meeting_update')));}
    void Birthday(){Navigator.push(context, RotationRoute(Page:MoreWebview(title:'Birthday & Anniversary',url:'http://www.avtyuwas.org/web/birthday')));}
    void profile(){Navigator.push(context, RotationRoute(Page:MoreWebview(title:'My Profile',url:'http://www.avtyuwas.org/web/profile')));}
    void suggestion() {Navigator.push(context, RotationRoute(Page: MoreWebview(title:'Suggestion',url:'http://www.avtyuwas.org/web/suggestion')));}
    void Achivements() {Navigator.push(context, RotationRoute(Page: MoreWebview(title:'Achivements',url:'http://www.avtyuwas.org/web/achievement')));}
    void info() {Provider.of<HomeScreenProvider>(context, listen: false).currentBottomIndex = 1;}
    void cont() {Provider.of<HomeScreenProvider>(context, listen: false).currentBottomIndex = 2;}
    void passchange() {Navigator.push(context, RotationRoute(Page: Changepassword()));}
    void jayanti() {Navigator.push(context, RotationRoute(Page: Jayanti()));}
    void follow() {Navigator.push(context, RotationRoute( Page: Followus()));}
    void committedetails() {Navigator.push(context, RotationRoute(Page:  Commiteedetails()));}
    void events() {Navigator.push(context, RotationRoute(Page: Events()));}
    void sportsleague() {Navigator.push(context, RotationRoute(Page: SportsLeague()));}
    var _moreitem = [
      Moreitem(
        iconleading: FontAwesomeIcons.calendarPlus,
        title: 'Maharaja Agrasen Jayanti',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: Maharaja_agrasen_jayanti
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.userCircle,
        title: 'My Profile',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: profile
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
        Callback: Metting_update
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.crown,
        title: 'Maharaja Agarsen Jayanti',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: jayanti
      ),
      Moreitem(
        iconleading: FontAwesomeIcons.gift,
        title: 'Birthday & Anniversary',
        icontrainel: Icons.arrow_forward_ios_rounded,
        Callback: Birthday
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
        Callback:Achivements
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
          Callback: suggestion
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
      body: GridView.builder(
        itemCount:_moreitem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w,
          childAspectRatio: (2 / 1),
        ),
        itemBuilder: (context,index,) {
          var item =_moreitem[index];
          return Padding(
            padding:  EdgeInsets.symmetric(vertical:4.w),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: InkWell(
                onTap: item.Callback,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(item.iconleading,color: Colors.white,),
                    Text(_moreitem[index].title,style: TextStyle(fontSize:15, color: Colors.white), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class Moreitem {
  final IconData? iconleading;
  final String title;
  final IconData? icontrainel;
  final VoidCallback? Callback;
  const Moreitem({Key, key, this.iconleading, required this.title, this.icontrainel, this.Callback});
}
