import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'member_filter.dart';
import '../../models/member_model.dart';

class FilterOption extends StatefulWidget {
  final List<MemberModel>? members;
  final FilterType? type;

  const FilterOption({this.members = const [], this.type});

  @override
  _FilterOption createState() => _FilterOption();
}

class _FilterOption extends State<FilterOption> {
  String _dropdownValue = '';
  var _dropDownItems = <String>[];
  List<MemberModel>? _pastevents = <MemberModel>[];
  List<MemberModel>? _searchResult = <MemberModel>[];

  @override
  void initState() {
    _pastevents = widget.members;
    _getDropdownValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFF0233ad),
          title: Text(
            _getTypeTitle(),
            style: TextStyle(fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              _dropDown(),
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

  void _onChange(String? value) {
    if (widget.type == FilterType.GOTRA) {
      _searchResult =
          _pastevents?.where((element) => element.gotra == value).toList();
    } else if (widget.type == FilterType.OCCUPATION) {
      _searchResult =
          _pastevents?.where((element) => element.occupation == value).toList();
    } else if (widget.type == FilterType.GENDER) {
      _searchResult =
          _pastevents?.where((element) => element.gender == value).toList();
    } else if (widget.type == FilterType.BLOOD_GROUP) {
      _searchResult =
          _pastevents?.where((element) => element.bloodGroup == value).toList();
    } else if (widget.type == FilterType.MARITAL_STATUS) {
      _searchResult =
          _pastevents?.where((element) => element.marrital == value).toList();
    }

    setState(() {
      _dropdownValue = value!;
    });
  }

  String _getTypeTitle() {
    switch (widget.type) {
      case FilterType.NAME:
        return 'Name';
      case FilterType.GOTRA:
        return 'Gotra';
      case FilterType.OCCUPATION:
        return 'Occupation';
      case FilterType.GENDER:
        return 'Gender';
      case FilterType.BLOOD_GROUP:
        return 'Blood Group';
      case FilterType.MARITAL_STATUS:
        return 'Marital Status';
      default:
        return '';
    }
  }

  Widget _dropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFF3749A4),
        ),
        child: DropdownButton(
          underline: SizedBox(),
          dropdownColor: Color(0xFFF3749A4),
          value: _dropdownValue,
          style: TextStyle(color: Colors.white),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          items: _dropDownItems.map((String item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: _onChange,
        ),
      ),
    );
  }

  void _getDropdownValues() {
    if (widget.type == FilterType.GOTRA) {
      _dropDownItems.clear();
      _dropDownItems = ['Select Gotra'];
      _dropdownValue = _dropDownItems[0];

      widget.members
          ?.map((e) => e.gotra)
          .toList()
          .toSet()
          .toList()
          .forEach((element) {
        _dropDownItems.add(element!);
      });
    } else if (widget.type == FilterType.OCCUPATION) {
      _dropDownItems.clear();
      _dropDownItems = ['Select Occupation'];
      _dropdownValue = _dropDownItems[0];

      widget.members
          ?.map((e) => e.occupation)
          .toList()
          .toSet()
          .toList()
          .forEach((element) {
        _dropDownItems.add(element!);
      });
    } else if (widget.type == FilterType.GENDER) {
      _dropDownItems.clear();
      _dropDownItems = ['Select Gender'];
      _dropdownValue = _dropDownItems[0];

      widget.members
          ?.map((e) => e.gender)
          .toList()
          .toSet()
          .toList()
          .forEach((element) {
        _dropDownItems.add(element!);
      });
    } else if (widget.type == FilterType.BLOOD_GROUP) {
      _dropDownItems.clear();
      _dropDownItems = ['Select Blood Group'];
      _dropdownValue = _dropDownItems[0];

      widget.members
          ?.map((e) => e.bloodGroup)
          .toList()
          .toSet()
          .toList()
          .forEach((element) {
        _dropDownItems.add(element!);
      });
    } else if (widget.type == FilterType.MARITAL_STATUS) {
      _dropDownItems.clear();
      _dropDownItems = ['Select Marital Status'];
      _dropdownValue = _dropDownItems[0];

      widget.members
          ?.map((e) => e.marrital)
          .toList()
          .toSet()
          .toList()
          .forEach((element) {
        _dropDownItems.add(element!);
      });
    }
  }
}
