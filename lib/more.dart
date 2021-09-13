import 'package:avt_yuwas/appbar.dart';
import 'package:avt_yuwas/more_webview.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models/menu_model.dart';
import 'follow_us.dart';

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
    var data = await Services.getMenus('app_menu');
    if (data.statusCode == 200) {
      _menuItems = data.data;
    }
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: (_menuItems?.length ?? 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 1.w,
                mainAxisSpacing: 1.w,
                childAspectRatio: (2 / 1.2),
              ),
              itemBuilder: (context, index) {
                var item = _menuItems![index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.05),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if(item.menu == 'Logout')
                      {
                        return showDialog(
                            context: context,
                            builder: (context)=>AlertDialog(
                              title: Text('Do you want to exit'),
                              actions:<Widget> [
                                TextButton(
                                    onPressed:() => Navigator.pop(context,false),
                                    child: Text('No',style:TextStyle(fontSize:18.sp,color: Colors.black),)
                                ),
                                TextButton(
                                    onPressed:() => Navigator.pop(context,true),
                                    child: Text('Yes',style:TextStyle(fontSize:18.sp,color: Colors.black),)
                                ),
                              ],
                            ));
                      }
                      if(item.menu == 'Follow Us')
                      {
                        Navigator.push(context, RotationRoute(Page:Followus()));

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
                              CupertinoPageRoute(builder: (_) => MoreWebview(
                                  title: '${item.menu}',
                                      url: '${item.link}')));
                        }
                      }

                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(NetworkImage('${item.icon}'),
                            color: Colors.white),
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
  const SubMenus({Key? key, this.title = '', this.childMenus = const []}) :super(key: key);
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
                  title: Text('${subMenu.menu}',style: TextStyle(color:Colors.white),),
                  onTap: () async {
                    if (subMenu.webLink != null) {
                      Navigator.push(context, CupertinoPageRoute(builder: (_) => MoreWebview(title: '${subMenu.menu}', url: '${subMenu.link}')));
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
