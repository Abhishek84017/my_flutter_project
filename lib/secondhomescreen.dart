import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';
import 'package:avt_yuwas/constants/palette.dart';

class SecondHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: appBar(
        context: context,
        title: 'Avt Yuwas',
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            child: Container(
                width: size.width,
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Color(0xFFF0233ad).withOpacity(0.7),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'KAUN BANEGA CHAMPION -12TH SEPT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            height: size.height * 0.30,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assests/images/agrawalachivers.jpg'),
                  fit: BoxFit.fill,
                )),
          ),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                        indicatorColor: Palette.appbarcolor,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        tabs: [
                          Tab(
                            text: 'DETAILS',
                          ),
                          Tab(
                            text: 'PHOTOS',
                          ),
                        ]
                    ),
                    Expanded(
                      child: TabBarView(
                          children: [
                            Text('hello',style:TextStyle(color: Colors.white),),
                            Text('hii',style:TextStyle(color: Colors.white),),
                          ]
                      ),
                    ),
                  ],
                )
            ),
          )

        ],
      ),
    );
  }
}
