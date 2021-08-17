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
        subtitle: '1st floor below Dwarka Hall,City Light,Surat-395007,Gujrat(India). +91 2612226688/89/90',
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _constactItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  var contactItem = _constactItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text('${contactItem.title}'),
                      subtitle: Text('${contactItem.subtitle}'),
                      trailing: Icon(contactItem.icon),
                      dense: true,
                      onTap: () async {
                        if (await canLaunch(contactItem.url ?? '')) {
                          await launch(contactItem.url ?? '');
                        }
                      },
                    ),
                  );
                }),
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
