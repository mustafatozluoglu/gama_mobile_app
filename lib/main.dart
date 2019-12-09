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
import 'package:gama_app/taahhut.dart' as prefix0;
import 'package:gama_app/yapisletdevret.dart';
import 'package:gama_app/yapisletdevret.dart' as prefix1;
import 'package:x509csr/x509csr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:custom_navigator/custom_navigator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GAMA_APP',
    home: HomeScreen(),
  ));
}

Image appBar = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo.jpg"),
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
        appBar: AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Text('Projects'),
              margin: const EdgeInsets.only(top: 5.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.blue[900],
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/projeler_resim.jpg',
                    width: 300,
                    height: 75,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjelerScreen()),
                    );
                  }), // button projeler
            ),
            Container(
              child: Text('Human Resources'),
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.blue[900],
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/human_resources.jpg',
                    width: 300,
                    height: 75,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {}), // button ik
            ),
            Container(
              child: Text('General Application'),
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 1.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.blue[900],
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/general_application.jpg',
                    width: 300,
                    height: 75,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {}), // button genel basvuru
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Image.asset('assets/images/gama_iletisim.png'),
            )
          ],
        ),
      ),
    );
  }
}

class ProjelerScreen extends StatefulWidget {
  @override
  _ProjelerScreenState createState() => _ProjelerScreenState();
}

class _ProjelerScreenState extends State<ProjelerScreen> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Text('Constracting Projects'),
              margin: const EdgeInsets.only(top: 25.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(10, 1, 10, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.blue[900],
                  ),
                ),
                textColor: Colors.white,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/projeler_resim.jpg',
                  height: 150,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaahhutProjeleriScreen()),
                  );
                },
              ),
            ),
            Container(
              child: Text('Build Operateand Transfer Projects'),
              margin: const EdgeInsets.only(top: 45.0),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(10, 1, 10, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.blue[900],
                  ),
                ),
                textColor: Colors.white,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/yapisletdevret.jpg',
                  height: 150,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YapIsletDevretScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 ** NAVIGATION BAR **
 

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    TaahhutProjeleriScreen(),
    YapIsletDevretScreen(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          fixedColor: Colors.blue[900],
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
              ),
              title: new Text('HOME'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.store),
              title: new Text('CP'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.business),
              title: new Text('BOT'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
