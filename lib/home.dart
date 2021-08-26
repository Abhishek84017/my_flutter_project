import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _events = <_EventsModel>[
  new _EventsModel(
    image: 'assests/images/kawadyatra.jpg',
    title: 'Vishal Kwad Yatra',
    date: DateTime(Random().nextInt(12), 2021),
  ),
  new _EventsModel(
    image: 'assests/images/industrial.jpg',
    title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT.LTD',
    date: DateTime(Random().nextInt(12), 2021),
  ),
  new _EventsModel(
    image: 'assests/images/annualmeeting.jpg',
    title: '16TH ANNUAL GENRAL MEETING ',
    date: DateTime(Random().nextInt(12), 2021),
  ),
  new _EventsModel(
      image: 'assests/images/agrawalachivers.jpg',
      title: 'AGRAWAl ACHIVERS-18TH OCT 20 ',
      date: DateTime(Random().nextInt(12), 2021))
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Bannerimages(),
            Container(
              height: 35,
              width: double.infinity,
              color: Color(0xff123456),
              child: Center(
                  child: Text('Past Events', style: TextStyle(color: Colors.white),
              )),
            ),
            Listview(),
          ],
        ));
  }
}

class Bannerimages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          autoPlay: true,
        ),
        items: _events
            .map((event) => Container(
                  constraints: BoxConstraints.tight(size),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${event.image}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(
                            120.w,
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: event.callback,
                      child: Text(
                        'JOIN',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ))
            .toList());
  }
}
class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _events.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset('${_events[index].image}'),
                ),
                Positioned(
                  bottom: 12,
                  child: Container(
                      width: size.width,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Color(0xFFF0233ad).withOpacity(0.7),
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${_events[index].title}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            );
          }),
    );
  }
}
class _EventsModel {
  final String? image;
  final String? title;
  final DateTime? date;
  final VoidCallback? callback;
  const _EventsModel({this.title, this.date, this.image, this.callback,});
}
