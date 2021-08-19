import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

//ignore: must_be_immutable
class Contact extends StatelessWidget {
  var _constactItemList = [
    ContactItem(
        icon: Icons.phone,
        url: 'tel:9328054757',
        subtitle: 'Mr.SANJAY.M.AGGARWL(PRESIDENT)',
        title: 'CALL US'),
    ContactItem(
        icon: Icons.phone,
        url: 'tel:9909652534',
        subtitle: 'Mr.NISHITH BEDIA(Vice-president)',
        title: 'CALL US'),
    ContactItem(
        icon: Icons.phone,
        url: 'tel:9016285978',
        subtitle: 'Mr.RAHUL AGARWAL(IPP)',
        title: 'CALL US'),
    ContactItem(
        icon: Icons.phone,
        url: 'email:abhishekpatel@gmail.com',
        subtitle: 'Mr.NIKHIL AGARWAL(Secretary)',
        title: 'CALL US'),
    ContactItem(
        icon: Icons.email_rounded,
        url: "mailto:patelabhishek102001@gmail.in?subject=&body=%20",
        subtitle: 'info@actyuwas.org',
        title: 'Email US'),
    ContactItem(
        icon: Icons.sports_volleyball,
        url: "https://avtyuwas.org",
        subtitle: 'www.avtyuwas.org',
        title: 'Visit Website'),
    ContactItem(
        icon: Icons.not_listed_location,
        subtitle: '1st floor below Dwarka Hall,City Light,Surat-395007,Gujrat(India). +91 2612226688/89/90 +91 9687666677 agrawalvikastrust@gmail.com info@agrawalvikassurat.org',
        title: 'Maharaja Agrasen Bhawan'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    title: Text('${contactItem.title}',style: TextStyle(color: Colors.white),),
                    subtitle: Text('${contactItem.subtitle}',style: TextStyle(color: Colors.white),),
                    trailing: Icon(contactItem.icon,color: Colors.white,),

                    onTap: () async {
                      if (await canLaunch(contactItem.url ?? '')) {
                        await launch(contactItem.url ?? '');
                      }
                    },
                  );
                }, separatorBuilder: (BuildContext context, int index) {return Divider(color: Colors.grey.withOpacity(0.5),height:0.8,thickness:1.5,);},),
          ),
        ],
      ),
    );
  }
}

class ContactItem {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final String? url;


  const ContactItem({this.title, this.subtitle, this.icon, this.url});
}
