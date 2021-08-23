import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//ignore: must_be_immutable
class Commiteedetails extends StatelessWidget {
  var _constactItemList = [
    ContactItem(
      iconleading: Icons.home,
      title: 'Past President',
      icontrailing: FontAwesomeIcons.chevronRight,
    ),
    ContactItem(
      iconleading: FontAwesomeIcons.globeAmericas,
      title: 'Office Beares',
      icontrailing: FontAwesomeIcons.chevronRight,
    ),
    ContactItem(
      iconleading: FontAwesomeIcons.users,
      title: 'Working Committee',
      icontrailing: FontAwesomeIcons.chevronRight,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: const Text('COMMITTEE DETAILS', style: TextStyle(fontSize: 16),),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.bell, size: 22.sp,), onPressed: () {},),],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _constactItemList.length,
              itemBuilder: (BuildContext context, int index) {
                var contactItem = _constactItemList[index];
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
                  onTap: () {},
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

class ContactItem {
  final String? title;
  final IconData? iconleading;
  final IconData? icontrailing;
  const ContactItem({this.title, this.iconleading, this.icontrailing});
}
