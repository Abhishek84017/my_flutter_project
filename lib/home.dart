import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/models/upcoming_events.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/models/past_event.dart';
import 'constants/global.dart';
import 'more_webview.dart';
import 'secondhomescreen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
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

class Bannerimages extends StatefulWidget {
  @override
  _BannerimagesState createState() => _BannerimagesState();
}

class _BannerimagesState extends State<Bannerimages> {
  int currentPos = 0;
  var upcomingevents = <UpcomingEventsmodel>[];

  @override
  void initState() {
    _fetchupcomingevent();
    super.initState();
  }

  void _fetchupcomingevent() async {
    var responce = await Services.UpcominEvent();
    if (responce.statusCode == 200) {
      upcomingevents = responce.data!;
      setState(() {});
    } else {
      print(responce.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1.0,
                initialPage: 0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            items: upcomingevents.map((event) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Urls.IMAGE_BASE_URL}${event.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomRight,
                child: event.applyStatus == '0'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () async {
                            final url =
                                'https://www.avtyuwas.org/json/fill_form/${event.id}';
                            Navigator.push(
                                context,
                                RotationRoute(
                                    Page: MoreWebview(
                                        url: url, title: '${event.title}')));
                          },
                          child: Text(
                            'JOIN',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    : SizedBox(),
              );
            }).toList()),

        // indicator of banner
        Positioned(
          top: 30.w,
          bottom: 1.w,
          left: 3.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: upcomingevents.map((e) {
              int index = upcomingevents.indexOf(e);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: currentPos == index ? Colors.red : Colors.blue,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
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
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: pastevents.map((e) {
          final index = pastevents.indexOf(e);
          return GestureDetector(
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: kimagelogo,
                  image: '${Urls.IMAGE_BASE_URL}${pastevents[index].image}',
                  height: 200.h,
                  width: 1.sw,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      width: size.width,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Color(0xFFF0233ad).withOpacity(0.7),
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${pastevents[index].title}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  RotationRoute(
                      Page: SecondHomepage(
                    event: pastevents[index],
                  )));
            },
          );
        }).toList(),
      ),
    ));
  }
}
