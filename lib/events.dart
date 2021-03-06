import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/secondhomescreen.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:avt_yuwas/services/rest_api.dart';
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
  List<PastEventsModel> _pastevents = <PastEventsModel>[];
  List<PastEventsModel> _searchResult = <PastEventsModel>[];
  bool _showingtext = true;
  bool isLoading = true;

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
    _pastevents = pasteventmodel;
    _searchResult = pasteventmodel;
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: _showingtext
            ? const Text(
                'Events',
                style: TextStyle(fontSize: 20),
              )
            : TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                cursorRadius: Radius.circular(50.0),
                cursorColor: Colors.white,
                autofocus: true,
                onChanged: _onChange,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 17.sp),
                ),
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _showingtext ? FontAwesomeIcons.search : Icons.cancel,
              size: 18.sp,
            ),
            onPressed: () {
              setState(() {
                _showingtext = !_showingtext;
              });
            },
          ),
        ],
      ),
          body: isLoading ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),)) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            children: _searchResult.map((e) {
              final index = _searchResult.indexOf(e);
              return Container(
                child: Container(
                  height: 100,
                  child: Card(
                    color: Color(0xFFF3749A4),
                    child: ListTile(
                      leading: SizedBox(
                          child: Image.network(
                        '${Urls.IMAGE_BASE_URL}${_searchResult[index].image}',
                        fit: BoxFit.cover,
                        width: 100,
                      )),
                      title: Text(
                        '${_searchResult[index].title}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${_searchResult[index].date}',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            RotationRoute(
                                Page: SecondHomepage(
                              event: _searchResult[index],
                            )));
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

  void _onChange(String value) {
    if (!_showingtext) {
      if (value.isNotEmpty) {
        _searchResult = [];
        _searchResult = _pastevents
            .where((element) =>
                element.title?.toLowerCase().contains(value.toLowerCase()) ?? false)
            .toList();
        setState(() {});
      }
    }
  }
}
