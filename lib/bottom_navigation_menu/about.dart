import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}
class _AboutState extends State<About> {
  bool _isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if(_isloading)
            Expanded(child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),))),
          Expanded(
            child: WebView(
              initialUrl: 'http://avtyuwas.org/web/about',
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (finish) {
                setState(() {
                  _isloading = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
