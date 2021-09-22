import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class YearSixteen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _moreitem = [
      Moreitem(
        title: 'Chess Compitition',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Carrom Compitition',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Darts Compitition',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Ganpati Visarjan',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Agrawals Got Talent',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Drama Birju Bawara',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Agrawals Fashion Icon',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Mega Housie',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Agrawals Achivers',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
      Moreitem(
        title: 'Garba Compitition',
        icontrainel: Icons.arrow_forward_ios_rounded,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(
          context: context,
          title: 'Year 2016-17',
          automaticallyImplyLeading: true),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: _moreitem.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _moreitem[index];
          return ListTile(
            tileColor: Colors.black26,
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            title: Padding(
              padding: EdgeInsets.only(left: 0.1.sw),
              child: Text(
                '${item.title}',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            trailing: Icon(
              item.icontrainel,
              color: Colors.white,
            ),
            focusColor: Colors.red,
            onTap: item.Callback,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.withOpacity(0.5),
            height: 0.8,
          );
        },
      ),
    );
  }
}

class Moreitem {
  final String? title;
  final IconData? icontrainel;
  final VoidCallback? Callback;

  const Moreitem({Key, key, this.title, this.icontrainel, this.Callback});
}
