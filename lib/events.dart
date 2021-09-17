import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/secondhomescreen.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'models/past_event.dart';

//ignore: must_be_immutable
class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  var pastevents = <PastEventsModel>[];
  @override
  void initState() {
    _fetchpastevents();
    super.initState();
  }

  void _fetchpastevents() async {
    var data = await Services.pastEvents('');
    var pasteventmodel = <PastEventsModel>[];
    data?.data?.forEach((event) {
      pasteventmodel.add(PastEventsModel.fromJson(event));
    });
    pastevents = pasteventmodel;
    setState(() {});
  }
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
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:10.0.w),
            child: Column(
              children: pastevents.map((e){
                final index = pastevents.indexOf(e);
                return Container(
                    child: Container(
                        height: 100,
                        child: Card(
                          color: Color(0xFFF3749A4),
                          child: ListTile(
                            leading: SizedBox(
                                child: Image.network('${Urls.IMAGE_BASE_URL}${pastevents[index].image}', fit: BoxFit.cover, width: 100,
                                )),
                            title: Text(
                              '${pastevents[index].title}',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${pastevents[index].date}',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(context, RotationRoute(Page: SecondHomepage(event: pastevents[index],)));
                            },
                          ),
                        ),
                      ),
                    );
              }).toList(),
            ),
          ),
        ),
    )
    );
  }
}

class ContactItem {
  final String? image;
  final String? title;
  final String? subtitle;
  const ContactItem({this.title, this.subtitle, this.image});
}
