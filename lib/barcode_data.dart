import 'package:flutter/material.dart';

class Scannerdata extends StatelessWidget {
  final String? Data;
  const Scannerdata({this.Data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text('${Data}',style:TextStyle(color: Colors.red,fontSize:35),)),
    );
  }
}
