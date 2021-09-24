import 'package:avt_yuwas/gallery_view/gallery_view.dart';
import 'package:avt_yuwas/models/past_event.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models/get_event_gallary_model.dart';

class SecondHomepage extends StatefulWidget {
  final PastEventsModel? event;
  SecondHomepage({this.event});
  @override
  _SecondHomepageState createState() => _SecondHomepageState();
}

class _SecondHomepageState extends State<SecondHomepage>
    with SingleTickerProviderStateMixin {
  List<EventGallaryModel>? _menuItems = <EventGallaryModel>[];
  TabController? _controller;
  void _fetcheventgallaryimage() async {

    var data = await Services.geteventgallary('${widget.event?.id}');
    if (data.statusCode == 200) {
      _menuItems = data.data;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller?.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: appBar(
        context: context,
        title: 'Avt Yuwas',
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            child: Stack(children: [
              Image.network('${Urls.IMAGE_BASE_URL}${widget.event?.image}'),
              Positioned(
                bottom: 12,
                child: Container(
                    width: size.width,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Color(0xFFF0233ad).withOpacity(0.7),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '${widget.event?.title}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ]),
          ),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                        controller: _controller,
                        indicatorColor: Palette.appbarcolor,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        tabs: [
                          Tab(
                            text: 'DETAILS',
                          ),
                          Tab(
                            text: 'PHOTOS',
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(controller: _controller, children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.event?.longDescription}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.5.sp,
                                height: 1.3),
                          ),
                        ),
                        GridView.builder(
                          itemCount: (_menuItems?.length ?? 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? 3
                                    : 2,
                            crossAxisSpacing: 1.w,
                            mainAxisSpacing: 1.w,
                            childAspectRatio: (2 / 1.2),
                          ),
                          itemBuilder: (context, index) {
                            var item = _menuItems![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    RotationRoute(
                                        Page: GalleryView(
                                            items: _menuItems,
                                            currentIndex: index)));
                              },
                              child: Image(
                                image: NetworkImage(
                                    '${Urls.IMAGE_BASE_URL}${item.image}'),
                                loadingBuilder: (context, child, chunk) {
                                  if (chunk == null) {
                                    return child;
                                  }
                                  return Container(
                                    height: 10,
                                    width: 10,
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ]),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _listener() {
    if (_controller?.index == 1) {
      _fetcheventgallaryimage();
    }
  }
}
