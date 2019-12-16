import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'main.dart';

Image appBarEn = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_en.png"),
  height: 35.0,
);

Image appBarTr = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_tr.png"),
  height: 35.0,
);

bool isEng = true;

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          iconTheme: IconThemeData(
            color: Colors.blue[900],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: isEng ? appBarEn : appBarTr,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ),
            Container(
              child: Text(
                'TR',
                style: TextStyle(color: Colors.black),
              ),
              margin: const EdgeInsets.only(top: 20.0),
            ),
            Switch(
              activeColor: Colors.blue[900],
              inactiveThumbColor: Colors.red[900],
              inactiveTrackColor: Colors.red[400],
              onChanged: (val) => setState(() => isEng = val),
              value: isEng,
            ),
            Container(
              child: Text(
                'EN',
                style: TextStyle(color: Colors.black),
              ),
              margin: const EdgeInsets.only(top: 20.0),
            ),
          ],
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
