import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'package:gama_app/entities/projectBOT.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gama_app/taahhut.dart';
import 'package:gama_app/yapisletdevret.dart';
import 'package:x509csr/x509csr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MaterialApp(
    title: 'GAMA_APP',
    home: HomeScreen(),
  ));
}

Image appBar = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo.jpg"),
  height: 35.0,
);

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue[900],
                  child: Text("PROJETS"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjelerScreen()),
                    );
                  }), // button projeler
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue[900],
                  child: Text("HR"),
                  onPressed: () {}), // button ik
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue[900],
                  child: Text("GENERAL APPLICATION"),
                  onPressed: () {}), // button genel basvuru
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 125, 0, 0),
              child: Image.asset('assets/images/gama_iletisim.png'),
            )
          ],
        ),
      ),
    );
  }
}

class ProjelerScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 75.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("CONTRACTING PROJECTS"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaahhutProjeleriScreen()),
                  );
                }), // button taahhut projeleri
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 75.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("BUILD OPERATE TRANSFER"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YapIsletDevretScreen()),
                  );
                }), // button yap islet devret
          )
        ]),
      ),
    );
  }
}
