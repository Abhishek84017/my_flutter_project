import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class More extends StatelessWidget {
  var _moreitem = [
    Moreitem(
      iconleading: Icons.date_range_outlined,
      title: 'Maharaja Agrasen Jayanti',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      title: 'hello',
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
    Moreitem(
      iconleading: Icons.home,
      icontrainel: Icons.arrow_forward_ios_rounded,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                itemCount: _moreitem.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _moreitem[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(item.iconleading),
                      title: Text('${item.title}'),
                      trailing: Icon(item.icontrainel),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Moreitem {
  final IconData? iconleading;
  final String? title;
  final IconData? icontrainel;
  const Moreitem({this.iconleading, this.title, this.icontrainel});
}
