import 'package:avt_yuwas/appbar.dart';
import 'package:avt_yuwas/models/upcoming_events.dart';
import 'package:avt_yuwas/more_webview.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chose_member.dart';
import 'members.dart';
import 'models/menu_model.dart';
import 'follow_us.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'events.dart';

//ignore: must_be_immutable
class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool _isLoading = true;
  List<MenuModel>? _menuItems = <MenuModel>[];

  @override
  void initState() {
    _fetchMenu();
    super.initState();
  }

  void _fetchMenu() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var isguest = sharedPreferences.getBool('isGuest');
    var data = await Services.getMenus('app_menu');
    if (data.statusCode == 200) {
      if (isguest != null && isguest) {
        _menuItems =
            data.data?.where((element) => element.type != 'g').toList();
      } else {
        _menuItems = data.data;
      }
    }
    _isLoading = false;
    setState(() {});
    print('hello');
    _menuItems?.forEach((element) {
      precacheImage(NetworkImage('${element.icon}'), context);
    });
    print('hello After');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: (_menuItems?.length ?? 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                crossAxisSpacing: 1.w,
                mainAxisSpacing: 1.w,
                childAspectRatio: (2 / 1.2),
              ),
              itemBuilder: (context, index) {
                var item = _menuItems![index];
                return Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.05),),
                  child: InkWell(
                    onTap: () async {
                      if (item.text == 'profile') {
                        final url =
                            '${Urls.IMAGE_BASE_URL}web/edit_profile?member=${item.id}';
                        Navigator.push(
                            context,
                            RotationRoute(
                                Page: MoreWebview(url: url, title: 'Profile')));
                        return;
                      }
                      if (item.menu == 'Logout') {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Do you want to logout'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          final SharedPreferences
                                              sharedPreferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          await sharedPreferences.clear();
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              RotationRoute(Page: Homepage()),
                                              (route) => false);
                                          // Navigator.pushAndRemoveUntil(context, RotationRoute(Page: Homepage()), () => false);
                                        },
                                        child: Text(
                                          'logout',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        )),
                                  ],
                                ));
                      }
                      if (item.menu == 'Follow Us') {
                        Navigator.push(
                            context, RotationRoute(Page: Followus()));
                      }
                      if (item.menu == 'Members') {
                        Navigator.push(context, RotationRoute(Page: Members()));
                      }
                      if (item.menu == 'Events') {
                        Navigator.push(context, RotationRoute(Page: Events()));
                      }
                      if (item.childMenu != null &&
                          item.childMenu!.isNotEmpty) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => SubMenus(
                                    title: item.menu,
                                    childMenus: item.childMenu)));
                      } else {
                        if (item.webLink != null && item.webviewStatus == '1') {
                          print(item.webviewStatus.runtimeType);
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => MoreWebview(
                                      title: '${item.menu}',
                                      url: '${item.link}')));
                        }
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(
                          NetworkImage('${item.icon}'),
                          color: Colors.white,
                        ),
                        // Image.network('${item.icon}',height: 20.h, loadingBuilder: (context, child, chunk) {
                        //     if (chunk == null) {
                        //       return child;
                        //     }
                        //     return Container(
                        //       height: 100.h,
                        //       width: 1.sw,
                        //       alignment: Alignment.center,
                        //       child: CircularProgressIndicator(),
                        //     );
                        //   },
                        // ),
                        Text('${item.menu}',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class SubMenus extends StatelessWidget {
  const SubMenus({Key? key, this.title = '', this.childMenus = const []})
      : super(key: key);
  final String? title;
  final List<ChildMenu>? childMenus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: '${title}'),
      backgroundColor: Colors.black,
      body: ListView(
        children: childMenus!
            .map((subMenu) => ListTile(
                  title: Text(
                    '${subMenu.menu}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    if (subMenu.webLink != null) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => MoreWebview(
                                  title: '${subMenu.menu}',
                                  url: '${subMenu.link}')));
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
