import 'package:avt_yuwas/pageroute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'filter_option.dart';
import 'models/member_model.dart';

//ignore: must_be_immutable
class MemberFilter extends StatefulWidget {
  final List<MemberModel>? members;

  const MemberFilter({Key? key, this.members}) : super(key: key);

  @override
  _MemberFilterState createState() => _MemberFilterState();
}

class _MemberFilterState extends State<MemberFilter> {
  final _gridlist = const [
    GridMemberFilterdata(type: FilterType.NAME, icon: FontAwesomeIcons.font),
    GridMemberFilterdata(type: FilterType.GOTRA, icon: FontAwesomeIcons.search),
    GridMemberFilterdata(
        type: FilterType.OCCUPATION, icon: FontAwesomeIcons.chalkboardTeacher),
    GridMemberFilterdata(
        type: FilterType.GENDER, icon: FontAwesomeIcons.venusDouble),
    GridMemberFilterdata(
        type: FilterType.BLOOD_GROUP, icon: FontAwesomeIcons.tint),
    GridMemberFilterdata(
        type: FilterType.MARITAL_STATUS, icon: FontAwesomeIcons.restroom)
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: InkWell(
                onTap: () {
                  if (gridData.type == FilterType.NAME) {
                    Navigator.pop(context, true);
                  } else
                    Navigator.push(
                        context,
                        RotationRoute(
                            Page: FilterOption(
                                type: gridData.type, members: widget.members)));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                              child: Icon(
                        gridData.icon,
                        color: Color(0xFFF3749A4),
                        size: 48.sp,
                      ))),
                      Container(
                        height: 40.h,
                        color: Color(0xFFF3749A4),
                        child: Center(
                            child: Text(
                          _getTypeTitle(gridData.type),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  String _getTypeTitle(FilterType? type) {
    switch (type) {
      case FilterType.NAME:
        return 'Name';
      case FilterType.GOTRA:
        return 'Gotra';
      case FilterType.OCCUPATION:
        return 'Occupation';
      case FilterType.GENDER:
        return 'Gender';
      case FilterType.BLOOD_GROUP:
        return 'Blood Group';
      case FilterType.MARITAL_STATUS:
        return 'Marital Status';
      default:
        return '';
    }
  }
}

class GridMemberFilterdata {
  final IconData? icon;
  final FilterType? type;
  const GridMemberFilterdata({this.type, this.icon,});
}
enum FilterType { NAME, GOTRA, OCCUPATION, GENDER, BLOOD_GROUP, MARITAL_STATUS }
