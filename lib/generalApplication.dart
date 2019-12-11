import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

Image appBar = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo.jpg"),
  height: 35.0,
);

class GeneralApplicationScreen extends StatefulWidget {
  @override
  _GeneralApplicationScreenState createState() =>
      _GeneralApplicationScreenState();
}

class _GeneralApplicationScreenState extends State<GeneralApplicationScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: WebView(
          key: UniqueKey(),
          initialUrl:
              "https://holding.gama.com.tr/en/career/career-at-gama/general-application/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewConroller) {
            _controller.complete(webViewConroller);
          },
        ),
      ),
    );
  }
}
