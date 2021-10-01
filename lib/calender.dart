import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/secondhomescreen.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'constants/palette.dart';
import 'models/past_event.dart';
import 'package:intl/intl.dart';
import 'package:date_util/date_util.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  var pastevents = <PastEventsModel>[];
  var _alleventData = <PastEventsModel>[];
  List<String> _eventDates = [];

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
    _eventDates = pastevents.map((e) => '${e.date}').toList();

    setState(() {});
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    // _alleventData = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
        automaticallyImplyLeading: true,
        backgroundColor: Palette.appbarcolor,
      ),
      body: Column(
        children: [
          TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.

                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarBuilders:
                  CalendarBuilders(defaultBuilder: (context, day, day1) {
                // print(pastevents
                //     .where((e) => e.date!.contains(
                //     DateFormat('yyyy-MM-dd').format(day).toString()))
                //     .toList());

                if (_eventDates
                    .contains(DateFormat('yyyy-MM-dd').format(day))) {
                  // print(pastevents
                  //     .where((e) => e.date!.contains(
                  //     DateFormat('yyyy-MM-dd').format(day).toString()))
                  //     .toList());
                  _alleventData.addAll(pastevents
                      .where((e) => e.date!
                          .contains(DateFormat('yyyy-MM-dd').format(day)))
                      .toList());
                  // _alleventData.sort((a, b) {
                  //   var date1 = DateTime.tryParse('$a') ?? DateTime.now();
                  //   var date2 = DateTime.tryParse('$b') ?? DateTime.now();
                  //   if (date1.isBefore(date2)) {
                  //     return 1;
                  //   } else {
                  //     return 0;
                  //   }
                  // });
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              }),
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (d) {

                _alleventData.clear();
                print('hello');
                // No need to call `setState()` here

                var dateUtility = DateUtil();
                var totaldays = dateUtility.daysInMonth(d.month, d.year);
                print(totaldays);
                _focusedDay = d;

                // var listofdate = new List<int>.generate(totaldays, (i) => ${i+1}/${d.month}/${d.year});
                // print(listofdate);
                List<String> days = [];
                for (int i = 1; i < totaldays; i++) {
                  days.add(DateFormat('yyyy-MM-dd')
                      .format(DateTime(d.year, d.month, i)));
                }

                print(pastevents
                    .where((e) => e.date!.contains(DateFormat('yyyy-MM-dd')
                        .format(DateTime(2021,08,16))
                        .toString()))
                    .toList());
                // print(pastevents.map((e) => e.date).toList());
                days.forEach((element) {
                  _alleventData.addAll(pastevents
                        .where((e) => e.date!.contains(DateFormat('yyyy-MM-dd')
                            .format(DateTime.parse(element))
                            .toString()))
                        .toList());

                });
                setState(() {});
              }),
          const SizedBox(height: 8.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _alleventData.map((e) {
                  final index = _alleventData.indexOf(e);
                  return Container(
                    child: Container(
                      height: 100,
                      child: Card(
                        color: Color(0xFFF3749A4),
                        child: ListTile(
                          leading: SizedBox(
                              child: Image.network(
                            '${Urls.IMAGE_BASE_URL}${_alleventData[index].image}',
                            fit: BoxFit.cover,
                            width: 100,
                          )),
                          title: Text(
                            '${_alleventData[index].title}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${_alleventData[index].date}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                RotationRoute(
                                    Page: SecondHomepage(
                                  event: _alleventData[index],
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
        ],
      ),
    );
  }
}

// class Calendar extends StatefulWidget {
//   const Calendar({Key? key}) : super(key: key);
//
//   @override
//   _CalendarState createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//   var _focusDay = DateTime.now();
//   List<PastEventsModel> _events = <PastEventsModel>[];
//   List<PastEventsModel> _eventsList = <PastEventsModel>[];
//   List<String> _eventDates = [];
//
//   void _fetchEvents() async {
//     var data = await Services.pastEvents('');
//     data?.data?.forEach((event) {
//       _events.add(new PastEventsModel.fromJson(event));
//     });
//     _eventsList = _events;
//     _eventDates = _eventsList.map((e) => '${e.date}').toList();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchEvents();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         children: [
//           TableCalendar(
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               focusedDay: _focusDay,
//               calendarBuilders:
//                   CalendarBuilders(defaultBuilder: (context, day, _) {
//                 if (_eventDates
//                     .contains(DateFormat('yyyy-MM-dd').format(day))) {
//                   return Container(
//                       padding: EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                           color: Colors.red, shape: BoxShape.circle),
//                       child: Text(day.day.toString(),
//                           style: TextStyle(color: Colors.white)));
//                 }
//                 final events = _events.where((event) {
//                   var date = DateFormat('yyyy-MM-dd').parse('${event.date}');
//                   print(DateFormat('yyyy-MM-dd').format(date));
//                   print(DateFormat('yyyy-MM-dd').format(day));
//                   return DateFormat('yyyy-MM-dd').format(date) ==
//                       DateFormat('yyyy-MM-dd').format(day);
//                 });
//                 print(events);
//               }),
//               onPageChanged: (day) {
//                 _focusDay = day;
//                 setState(() {});
//               }),
//           Expanded(
//             child: ListView.builder(
//                 itemBuilder: (context, index) => Container(
//                       child: Container(
//                         height: 100,
//                         child: Card(
//                           color: Color(0xFFF3749A4),
//                           child: ListTile(
//                             leading: SizedBox(
//                                 child: Image.network(
//                               '${Urls.IMAGE_BASE_URL}${_eventsList[index].image}',
//                               fit: BoxFit.cover,
//                               width: 100,
//                             )),
//                             title: Text(
//                               '${_eventsList[index].title}',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             subtitle: Text(
//                               '${_eventsList[index].date}',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   RotationRoute(
//                                       Page: SecondHomepage(
//                                           event: _eventsList[index])));
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                 itemCount: _eventsList.length),
//           )
//         ],
//       ),
//     ));
//   }
// }
