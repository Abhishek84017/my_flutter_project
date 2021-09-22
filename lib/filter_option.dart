import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models/member_model.dart';

//ignore: must_be_immutable
class FilterOption extends StatefulWidget {
  final String? title;

  const FilterOption({this.title});

  @override
  _FilterOption createState() => _FilterOption();
}

class _FilterOption extends State<FilterOption> {
  String dropdownvalue = 'Select Gender';
  var items = ['Select Gender', 'Male', 'Female', 'd'];
  List<MemberModel>? _pastevents = <MemberModel>[];
  List<MemberModel>? _searchResult = <MemberModel>[];
  bool _showingtext = true;

  @override
  void initState() {
    _fetchpastevents();
    super.initState();
  }

  void _fetchpastevents() async {
    var data = await Services.getMembers('members');
    if (data.statusCode == 200) {
      _pastevents = data.data;
      _searchResult = data.data;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFF0233ad),
          title: Text(
            '${widget.title}',
            style: TextStyle(fontSize: 20),
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3749A4),
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    dropdownColor: Color(0xFFF3749A4),
                    value: dropdownvalue,
                    style: TextStyle(color: Colors.white),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    hint: Text(
                      'hello',
                      style: TextStyle(color: Colors.red, fontSize: 32),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              ..._searchResult!.map((e) {
                final index = _searchResult!.indexOf(e);
                return Container(
                  child: Container(
                    height: 70.h,
                    child: Card(
                      color: Color(0xFFF3749A4),
                      child: ListTile(
                        leading: SizedBox(
                            child: Icon(
                          FontAwesomeIcons.userCircle,
                          color: Colors.white,
                          size: 36.sp,
                        )),
                        title: Text(
                          '${_searchResult![index].name}',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        // subtitle: Text('hello',textAlign: TextAlign.right,style: TextStyle(color: Colors.red),),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }

  void _onChange(String value) {
    if (!_showingtext) {
      if (value.isNotEmpty) {
        _searchResult = [];
        _searchResult = _pastevents!
            .where((element) =>
                element.name?.toLowerCase().contains(value.toLowerCase()) ??
                false)
            .toList();
        setState(() {});
      }
    }
  }
}
