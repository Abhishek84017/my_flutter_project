import 'package:avt_yuwas/appbar.dart';
import 'package:avt_yuwas/more_webview.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models/menu_model.dart';


//ignore: must_be_immutable
class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool _isLoading = true;
  var _menuItems = <MenuModel>[];

  @override
  void initState() {
    _fetchMenu();
    super.initState();
  }

  void _fetchMenu() async {
    var data = await Services.getMenus('app_menu');
    if (data?.status != null) {
      var menus = <MenuModel>[];
      data?.data?.forEach((element) {
        menus.add(MenuModel.fromJson(element));
      });
      _menuItems = menus;
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
              itemCount: _menuItems.length,
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
                var item = _menuItems[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.05),
                    // borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (item.childMenu != null &&
                          item.childMenu!.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SubMenus(
                                    title: item.menu,
                                    childMenus: item.childMenu)));
                      } else {
                        if (item.webLink != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MoreWebview(
                                      title: '${item.menu}',
                                      url: '${item.webLink}')));
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
  const SubMenus({Key? key, this.title = '', this.childMenus = const []})
      : super(key: key);
  final String? title;
  final List<ChildMenu>? childMenus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: '${title}'),
      body: ListView(
        children: childMenus!
            .map((subMenu) => ListTile(
                  title: Text('${subMenu.menu}'),
                  onTap: () async {
                    if (subMenu.webLink != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MoreWebview(
                                  title: '${subMenu.menu}',
                                  url: '${subMenu.webLink}')));
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
