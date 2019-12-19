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

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue[900],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isEng ? appBarEn : appBarTr,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GAMA Holding A.Ş.\n',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Adres:	GAMA Binası, Nergiz Sokak No: 9, Beştepe, Yenimahalle 06560 Ankara, Turkey\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Telefon:	+90 (312) 248 42 00\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Fax:	+90 (312) 248 42 01\n',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Mail: holding@gama.com.tr\n',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
