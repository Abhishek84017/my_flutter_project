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
    var data = await Services.upcomingEvents('');
    var upcomingevents = <UpcomingEventsmodel>[];
    data?.data?.forEach((event) {
      upcomingevents.add(UpcomingEventsmodel.fromJson(event));
    });
    upcomingeventsitem = upcomingevents;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Bannerimages(upcomingeventsitem),
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

class Bannerimages extends StatelessWidget {
  const Bannerimages(this.upcomingeventsitem);
  final List<UpcomingEventsmodel> upcomingeventsitem;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          autoPlay: true,
        ),
        items: upcomingeventsitem
            .map((event) => Container(
                  constraints: BoxConstraints.tight(size),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${event.image}'),
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
            print("${Urls.IMAGE_BASE_URL}${pastevents[index].image}");
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

