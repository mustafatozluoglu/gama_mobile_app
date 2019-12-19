import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gama_app/contact.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'package:gama_app/entities/projectBOT.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gama_app/generalApplication.dart';
import 'package:gama_app/taahhut.dart';
import 'package:gama_app/taahhut.dart' as prefix0;
import 'package:x509csr/x509csr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottomNavigationBar.dart';
import 'investments.dart';
import 'news.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GAMA_APP',
    home: new MyBottomNavigationBar(),
  ));
}

bool isEng = true;

Image appBarTr = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_tr.png"),
  height: 35.0,
);

Image appBarEn = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_en.png"),
  height: 35.0,
);

class HomeScreen extends StatefulWidget {
  // This widget is the root application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: isEng ? appBarEn : appBarTr,
          backgroundColor: Colors.white,
          actions: <Widget>[
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
          children: <Widget>[
            Container(
              child: Text(
                isEng ? 'Projects' : 'Projeler',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              margin: const EdgeInsets.only(top: 5.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey[850],
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey[850],
                  child: Image.asset(
                    'assets/images/projeler_resim.jpg',
                    width: 300,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaahhutProjeleriScreen()),
                    );
                  }), // button projeler
            ),
            Container(
              child: Text(
                isEng ? 'Investments' : 'Yatırımlar',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey[850],
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey[850],
                  child: Image.asset(
                    'assets/images/human_resources.jpg',
                    width: 300,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestmentsScreen()),
                    );
                  }),
            ),
            Container(
              child: Text(
                isEng ? 'News' : 'Haberler',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.grey[850],
                  ),
                ),
                textColor: Colors.white,
                color: Colors.grey[850],
                child: Image.asset(
                  'assets/images/news.png',
                  width: 300,
                  height: 80,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsScreen()),
                  );
                },
              ), // button genel basvuru
            ),
            Container(
              child: Text(
                isEng ? 'General Application' : 'Genel Başvuru',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.grey[850],
                  ),
                ),
                textColor: Colors.white,
                color: Colors.grey[850],
                child: Image.asset(
                  'assets/images/general_application.jpg',
                  width: 300,
                  height: 80,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GeneralApplicationScreen()),
                  );
                },
              ), // button genel basvuru
            ),
          ],
        ),
      ),
    );
  }
}
