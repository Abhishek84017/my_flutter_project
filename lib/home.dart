import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

final _events = <_EventsModel>[
  new _EventsModel(
      image: 'assests/images/3.jpg',
      title: 'Vishal Kwad Yatra',
      date: DateTime(Random().nextInt(12), 2021)),
  new _EventsModel(
      image: 'assests/images/4.jpg',
      title: 'INDEPENDENCE DAY',
      date: DateTime(Random().nextInt(12), 2021)),
  new _EventsModel(
      image: 'assests/images/5.jpg',
      title: 'INDUSTRIAL VISIT -HARI KRISHNA EXPORTS PVT.LTD',
      date: DateTime(Random().nextInt(12), 2021)),
  new _EventsModel(
      image: 'assests/images/3.jpg',
      title: '16TH ANNUAL GENRAL MEETING ',
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
                  child: Text(
                'Past Events',
                style: TextStyle(color: Colors.white),
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
    return Container(
      width: size.width,
      child: Container(
        child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              initialPage: 0,
              autoPlay: true,
            ),
            items: _events
                .map((event) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('${event.image}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
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
                        child: Text('${_events[index].title}',
                          style: TextStyle(color: Colors.white,),
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

  const _EventsModel({this.title, this.date, this.image});
}
