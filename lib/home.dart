import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/models/upcoming_events.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/models/past_event.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var upcomingeventsitem = <UpcomingEventsmodel>[];
  @override
  void initState() {
    _fetchupcomingevents();
    super.initState();
  }
  void _fetchupcomingevents() async {
    var responce = await Services.upcomingEvents('get_upcoming_events');
    if(responce?.statusCode == 200)
      {
        upcomingeventsitem = responce?.data;
        print(upcomingeventsitem);
      }
      else
        {
          print('something wrong');
        }
    setState(() {});
  }

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
                  child: Text('Past Events', style: TextStyle(color: Colors.white),)),
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
  var upcomingevents =<UpcomingEventsmodel>[];
  @override
  void initState() {
    _fetchupcomingevent();
    super.initState();
  }
  void _fetchupcomingevent() async
  {
    var responce= await Services.UpcominEvent('');
    if(responce.statusCode == 200)
      {

        upcomingevents = responce.data!;
        setState(() {});
      }
    else
      {
        print(responce.message);
      }

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          autoPlay: true,
        ),
        items: upcomingevents
            .map((event) => Container(
                  constraints: BoxConstraints.tight(size),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${Urls.IMAGE_BASE_URL}${event.image}'),
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

                      onPressed: () {},
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

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}
class _ListviewState extends State<Listview> {
  var pastevents= <PastEventsModel>[];
  @override
  void initState() {
    _fetchpastevents();
    super.initState();
  }
  void _fetchpastevents() async
  {
    var data= await Services.pastEvents('');
    var pasteventmodel = <PastEventsModel>[];
    data?.data?.forEach((event) {
      pasteventmodel.add(PastEventsModel.fromJson(event));});
    pastevents = pasteventmodel;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: pastevents.length,
          itemBuilder: (BuildContext context, int index) {

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.network('${Urls.IMAGE_BASE_URL}${pastevents[index].image}'),
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
                          '${pastevents[index].title}',
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

