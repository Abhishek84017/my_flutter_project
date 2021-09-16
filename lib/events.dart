import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
class Events extends StatelessWidget {
  var _constactItemList = [

    ContactItem(
        image: 'assests/images/kawadyatra.jpg',
        subtitle: '16 Aug 2021',
        title: 'Vishal Kwad Yatra -16th AUG'),
    ContactItem(
        image: 'assests/images/independenceday.jpg',
        subtitle: '15 Aug 2021',
        title: 'INDEPENDENCE DAY -15th AUG'),
    ContactItem(
        image: 'assests/images/annualmeeting.jpg',
        subtitle: '10 Aug 2021',
        title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT LTD-10 AUG'),
    ContactItem(
        image: 'assests/images/kawadyatra.jpg',
        subtitle: '16 Aug 2021',
        title: 'Vishal Kwad Yatra -16th AUG'),
    ContactItem(
        image: 'assests/images/independenceday.jpg',
        subtitle: '15 Aug 2021',
        title: 'INDEPENDENCE DAY -15th AUG'),
    ContactItem(
        image: 'assests/images/industrial.jpg',
        subtitle: '10 Aug 2021',
        title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT LTD-10 AUG'),
    ContactItem(
        image: 'assests/images/kawadyatra.jpg',
        subtitle: '16 Aug 2021',
        title: 'Vishal Kwad Yatra -16th AUG'),
    ContactItem(
        image: 'assests/images/independenceday.jpg',
        subtitle: '15 Aug 2021',
        title: 'INDEPENDENCE DAY -15th AUG'),
    ContactItem(
        image: 'assests/images/annualmeeting.jpg',
        subtitle: '10 Aug 2021',
        title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT LTD-10 AUG'),
    ContactItem(
        image: 'assests/images/kawadyatra.jpg',
        subtitle: '16 Aug 2021',
        title: 'Vishal Kwad Yatra -16th AUG'),
    ContactItem(
        image: 'assests/images/independenceday.jpg',
        subtitle: '15 Aug 2021',
        title: 'INDEPENDENCE DAY -15th AUG'),
    ContactItem(
        image: 'assests/images/industrial.jpg',
        subtitle: '10 Aug 2021',
        title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT LTD-10 AUG'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0233ad),
          title: const Text(
            'Events',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.search,
                size: 18.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: _constactItemList.length,
          itemBuilder: (BuildContext context, int index) {
            var contactItem = _constactItemList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 100,
                child: Card(
                  color: Color(0xFFF3749A4),
                  child: ListTile(
                    leading: SizedBox(
                        child: Image.asset(
                      '${contactItem.image}',
                      fit: BoxFit.cover,
                      width: 100,
                    )),
                    title: Text(
                      '${contactItem.title}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${contactItem.subtitle}',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContactItem {
  final String? image;
  final String? title;
  final String? subtitle;

  const ContactItem({this.title, this.subtitle, this.image});
}
