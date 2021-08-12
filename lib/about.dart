import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(35),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width:0.1),
        ),
        child: Text("Hello! I am in the container widget decoration box!!",
            style: TextStyle(fontSize: 5)),
         ),
      );
  }
}
