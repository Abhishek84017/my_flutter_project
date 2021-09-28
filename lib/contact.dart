import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'constants/palette.dart';

//ignore: must_be_immutable
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Position? _position;
  Uri? _url;
  List<ContactItem> _constactItemList = [];

  void _currentloacation() async {
    _position = await Geolocator.getCurrentPosition();

    _url = Uri.https('www.google.com', '/maps/dir/', {
      'api': '1',
      'destination': '21.1634372, 72.7922237',
      'origin': '${_position?.latitude}, ${_position?.longitude}'
    });

    _constactItemList = [
      ContactItem(
          icon: Icons.phone,
          url: 'tel:9586233081',
          subtitle: 'Mr.Nikhil Agarwal(PRESIDENT)',
          title: 'CALL US'),
      ContactItem(
          icon: Icons.phone,
          url: 'tel:9825133853',
          subtitle: 'Mr.Neeraj Agrawal(Vice-president)',
          title: 'CALL US'),
      ContactItem(
          icon: Icons.phone,
          url: 'tel:9909652534',
          subtitle: 'Mr.Nishith Bedia (IPP)',
          title: 'CALL US'),
      ContactItem(
          icon: Icons.email_rounded,
          url: "mailto:info@avtyuwas.org?subject=&body=%20",
          subtitle: 'info@actyuwas.org',
          title: 'Email US'),
      ContactItem(
          icon: Icons.sports_volleyball,
          url: "https://avtyuwas.org",
          subtitle: 'www.avtyuwas.org',
          title: 'Visit Website'),
      ContactItem(
          icon: Icons.not_listed_location,
          url: _url.toString(),
          subtitle:
              '1st floor below Dwarka Hall, City Light, Surat - 395007, Gujrat(India). +91 2612226688/89/90 +91 9687666677.agrawalvikastrust@gmail.com info@agrawalvikassurat.org',
          title: 'Maharaja Agrasen Bhawan'),
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentloacation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _constactItemList.length,
              itemBuilder: (BuildContext context, int index) {
                var contactItem = _constactItemList[index];
                return ListTile(
                  dense: true,
                  title: Text(
                    '${contactItem.title}',
                    style: TextStyle(color: Palette.Textcolor),
                  ),
                  subtitle: Text(
                    '${contactItem.subtitle}',
                    style: TextStyle(color: Palette.Textcolor),
                  ),
                  trailing: Icon(
                    contactItem.icon,
                    color: Palette.Textcolor,
                  ),
                  onTap: () async {
                    if (await canLaunch(contactItem.url ?? '')) {
                      await launch(contactItem.url ?? '');
                    }
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.withOpacity(0.5),
                  height: 0.8,
                  thickness: 1.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final String? url;

  const ContactItem({this.title, this.subtitle, this.icon, this.url});
}
