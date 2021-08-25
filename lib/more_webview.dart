import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MoreWebview extends StatefulWidget {
  const MoreWebview({Key? key,  required this.title, required this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  _MoreWebviewState createState() => _MoreWebviewState();
}
class _MoreWebviewState extends State<MoreWebview> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isloading ?'Loading....':widget.title),backgroundColor: Color(0xFFF0233ad),),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl:widget.url,
            onPageStarted: (finish) {
              setState(() {
                isloading = false;
              });
            },
          ),
          isloading ? Center( child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.red),),) : Stack(),
        ],
      ),
    );
  }
}
