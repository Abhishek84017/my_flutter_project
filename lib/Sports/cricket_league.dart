import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/more_webview.dart';
//ignore: must_be_immutable
class CricketLeague extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void APL18(){Navigator.push(context, RotationRoute( Page:MoreWebview(title:'APL(U-18)',url:'https://cricheroes.in/tournament/19/AGRAWAL-PREMIER-LEAGUE-(U-18-TOURNAMENT)',),));}
    void APL(){Navigator.push(context, RotationRoute( Page:MoreWebview(title:'APL',url:'https://cricheroes.in/tournament/15/AGRAWAL-PREMIER-LEAGUE-(SEASON---8)',),));}
    var _sportsItemList = [
      Sportsleague(
        title: 'APL',
        icontrailing: FontAwesomeIcons.chevronRight,
        Callback: APL
      ),
      Sportsleague(
        title: 'APL(U-18)',
        icontrailing: FontAwesomeIcons.chevronRight,
        Callback: APL18
      ),
      Sportsleague(
        title: 'APL 9 2018',
        icontrailing: FontAwesomeIcons.chevronRight,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: const Text('Cricket League', style: TextStyle(fontSize: 16),),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.bell, size: 22.sp,), onPressed: () {},),],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _sportsItemList.length,
              itemBuilder: (BuildContext context, int index) {
                var contactItem = _sportsItemList[index];
                return ListTile(
                  dense: true,
                  title: Text(
                    '${contactItem.title}',
                    style: TextStyle(color: Colors.white,fontSize:18),
                  ),
                  trailing: Icon(
                    contactItem.icontrailing,
                    color: Colors.white,),
                  onTap:contactItem.Callback,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.withOpacity(0.5),
                  height: 0.8,
                  thickness: 1.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Sportsleague {
  final String? title;
  final IconData? icontrailing;
  final VoidCallback?  Callback;
  const Sportsleague({this.title, this.icontrailing,this.Callback,});
}
