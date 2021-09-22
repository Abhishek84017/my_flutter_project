import 'package:avt_yuwas/pageroute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'filter_option.dart';

//ignore: must_be_immutable
class MemberFilter extends StatelessWidget {
  var _gridlist = [
    GridMemberFilterdata(title: 'name', icon:FontAwesomeIcons.font),
    GridMemberFilterdata(title: 'Gotra', icon:FontAwesomeIcons.search),
    GridMemberFilterdata(title: 'Occupation', icon:FontAwesomeIcons.chalkboardTeacher),
    GridMemberFilterdata(title: 'Gender', icon: FontAwesomeIcons.venusDouble),
    GridMemberFilterdata(title: 'BloodGroup', icon:  FontAwesomeIcons.tint),
    GridMemberFilterdata(title: 'Marital Status', icon:FontAwesomeIcons.restroom)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(
            context: context,
            title: 'Member Filter',
            automaticallyImplyLeading: true),
        backgroundColor: Colors.black,
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 3
                    : 2,

          ),

          itemCount: _gridlist.length,
          itemBuilder: (BuildContext context, int index) {
            var gridData = _gridlist[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:6.0,vertical:10.0),
              child: InkWell(
                onTap: ()
                {
                    if(gridData.title == 'name')
                      {
                        Navigator.pop(context,true);
                      }
                    else
                      Navigator.push(context, RotationRoute(Page:FilterOption(title:gridData.title,)));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(child: Center(child: Icon(gridData.icon,color:Color(0xFFF3749A4),size:48.sp,))),
                      Container(
                        height:40.h,
                        color:Color(0xFFF3749A4),
                        child: Center(child: Text('${gridData.title}',style: TextStyle(color: Colors.grey,fontSize:18.sp,fontWeight: FontWeight.bold),)),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class GridMemberFilterdata {
  final IconData? icon;
  final String? title;

  const GridMemberFilterdata({
    this.title,
    this.icon,
  });
}
