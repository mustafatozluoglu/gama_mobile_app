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
import 'package:gama_app/generalApplication.dart';
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
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GAMA_APP',
    home: new HomeScreen(),
  ));
}

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
  bool isEng = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
              child: Text(isEng ? 'Projects' : 'Projeler'),
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
              child: Text(isEng ? 'Human Resources' : 'İnsan Kaynakları'),
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
              child: Text(isEng ? 'General Application' : 'Genel Başvuru'),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneralApplicationScreen()),
                    );
                  }), // button genel basvuru
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
  bool isEng = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
        body: Column(
          children: <Widget>[
            Container(
              child:
                  Text(isEng ? 'Constracting Projects' : 'Taahhüt Projeleri'),
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
              child: Text(isEng
                  ? 'Build Operate and Transfer Projects'
                  : 'Yap İşlet Devret Projeleri'),
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
