import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'member_filter.dart';
import 'models/member_model.dart';

//ignore: must_be_immutable
class Members extends StatefulWidget {
  @override
  _Members createState() => _Members();
}

class _Members extends State<Members> {
  bool isLoading = true;
  List<MemberModel>? _memberdata = <MemberModel>[];
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
      _memberdata = data.data;
      _searchResult = data.data;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = new FocusNode();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0233ad),
        title: _showingtext
            ? const Text(
                'Members',
                style: TextStyle(fontSize: 20),
              )
            : TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                cursorRadius: Radius.circular(50.0),
                focusNode: focusNode,
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
          if (!isLoading)
            IconButton(
              icon: Icon(
                FontAwesomeIcons.filter,
                size: 18.sp,
              ),
              onPressed: () {
                Navigator.push(context,
                    RotationRoute(Page: MemberFilter(members: _memberdata)));
                setState(() {});
              },
            ),
        ],
      ),

      body: isLoading ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: _searchResult!.map((e) {
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
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

                            onTap: () {},
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    ));
  }

  void _onChange(String value) {
    if (!_showingtext) {
      if (value.isNotEmpty) {
        _searchResult = [];
        _searchResult = _memberdata!
            .where((element) =>
                element.name?.toLowerCase().contains(value.toLowerCase()) ??
                false)
            .toList();
        setState(() {});
      }
    }
  }
}
