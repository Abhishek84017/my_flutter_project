import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cricket_league.dart';
import 'cricketleague_tennisball.dart';
import 'Badmintonleague.dart';
//ignore: must_be_immutable
class SportsLeague extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void cricket() {Navigator.push(context, MaterialPageRoute(builder: (_) => CricketLeague()));}
    void crickettennisball() {Navigator.push(context, MaterialPageRoute(builder: (_) => Crickettennisball()));}
    void badminton() {Navigator.push(context, MaterialPageRoute(builder: (_) => Badmintonleague()));}
    var _sportsItemList = [
      Sportsleague(
          iconleading: FontAwesomeIcons.baseballBall,
          title: 'Cricket League',
          icontrailing: FontAwesomeIcons.chevronRight,
          Callback: cricket
      ),
      Sportsleague(
        iconleading: FontAwesomeIcons.basketballBall,
        title: 'Cricket League(Tennis Ball)',
        icontrailing: FontAwesomeIcons.chevronRight,
          Callback: crickettennisball
      ),
      Sportsleague(
        iconleading: FontAwesomeIcons.shuttleVan,
        title: 'Badminton League',
        icontrailing: FontAwesomeIcons.chevronRight, Callback: badminton
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: const Text('SPORTS LEAGUE', style: TextStyle(fontSize: 16),),
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
                  leading: Icon(
                    contactItem.iconleading,
                    color: Colors.white,
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
  final IconData? iconleading;
  final IconData? icontrailing;
  final VoidCallback? Callback;
  const Sportsleague({this.title, this.iconleading, this.icontrailing,this.Callback,});
}
