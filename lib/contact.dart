import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contact extends StatelessWidget
{

  final List<String> text =['Call US','Call US','Call US','Call US','Email US','Visit Website','Maharaja Agrasen Bhawan'];
  final List<String> nametext =['Mr.SANJAY.M.AGGARWL(President)','Mr.NISHITH BEDIA(Vice-president)','Mr.RAHUL AGARWAL(IPP)','Mr.NIKHIL AGARWAL(Secretary)','info@actyuwas.org','www.actyuwas.org','1st floor below Dwarka Hall,City Light,Surat-395007,Gujrat(India). +91 2612226688/89/90'];
  final List<IconData> symbol=[Icons.phone,Icons.phone,Icons.phone,Icons.phone,Icons.email_rounded,Icons.sports_volleyball,Icons.not_listed_location];
  @override
  Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:text.length,
                  itemBuilder:(BuildContext context, int index){
                   return Card(
                     child: ListTile(
                       title: Text('${text[index]}'),
                       subtitle: Text('${nametext[index]}'),
                       trailing: Icon(symbol[index]),
                       dense: true,
                       onTap: (){
                         if(index >= 0 && index < 4)
                           {
                             print(0);
                           }
                         if(index >=4)
                           {
                             print(1);
                           }
                       },
                     ),
                   );
              }
              ),
            ),
          ],
        ),
      );
  }

}
