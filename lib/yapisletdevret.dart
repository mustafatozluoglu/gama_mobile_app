import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gama_app/entities/projectBOT.dart';
import 'dart:async';

import 'main.dart';

Image appBarEn = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_en.png"),
  height: 35.0,
);

Image appBarTr = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_tr.png"),
  height: 35.0,
);

Image bot_top_pic_en = new Image(
  image: AssetImage('assets/images/bot_en_top.png'),
);

Image bot_top_pic_tr = new Image(
  image: AssetImage('assets/images/bot_tr_top.png'),
);

bool isEng = true;

class YapIsletDevret extends StatefulWidget {
  final List<ProjectBOT> projects;

  YapIsletDevret(this.projects);

  @override
  _YapIsletDevretState createState() => _YapIsletDevretState();
}

class _YapIsletDevretState extends State<YapIsletDevret> {
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.projects.length,
      itemBuilder: (context, int currentIndex) {
        return Container(
          child: Column(
            children: <Widget>[
              if (currentIndex == 0) isEng ? bot_top_pic_en : bot_top_pic_tr,
              Container(
                child: createViewItem(widget.projects[currentIndex], context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createViewItem(ProjectBOT project, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 10.0,
        child: new Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[900]),
          ),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                child: Image.network(
                  project.featured_image[0].thumb,
                ),
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        new Chip(
                          label: new Text(
                            project.post_title,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        new Chip(
                          label: new Text(
                            project.meta_data[0].location,
                            style: new TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new SecondScreenBOT(value: project),
        );
        Navigator.of(context).push(route);
      },
    );
  }
}

class SecondScreenBOT extends StatefulWidget {
  final ProjectBOT value;

  SecondScreenBOT({Key key, this.value}) : super(key: key);

  @override
  DetailProjectBOT createState() => DetailProjectBOT();
}

class DetailProjectBOT extends State<SecondScreenBOT> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.blue[900]),
        title: isEng ? appBarEn : appBarTr,
        backgroundColor: Colors.white,
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            child: new Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Padding(
                    child: Image.network(
                      widget.value.featured_image[0].large,
                      height: 150,
                    ),
                    padding: EdgeInsets.only(bottom: 8.0),
                  ),
                  Padding(
                    child: new Text(
                      widget.value.post_title,
                      style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(5.0),
                  ),
                  Padding(
                    child: new Text(
                      widget.value.post_content,
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/location.png',
                          height: 30,
                        ),
                        Text(
                          isEng ? '  Location : ' : '  Lokasyon : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.value.meta_data[0].location),
                      ],
                    ),
                    padding: EdgeInsets.all(2.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/hand.png',
                          height: 30,
                        ),
                        Text(
                          isEng
                              ? '  Commercial Operations : '
                              : '  Ticari İşletmeye Giriş Tarihi : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.value.meta_data[0].commercial_operation)
                      ],
                    ),
                    padding: EdgeInsets.all(2.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/time.png',
                          height: 30,
                        ),
                        Text(
                          isEng
                              ? '  Concession Period : '
                              : '  İmtiyaz Süresi : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.value.meta_data[0].concession_period)
                      ],
                    ),
                    padding: EdgeInsets.all(2.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/money.png',
                          height: 30,
                        ),
                        Text(
                          isEng
                              ? '  Investment Amount : '
                              : '  Yatırım Bedeli : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.value.meta_data[0].investment_amount)
                      ],
                    ),
                    padding: EdgeInsets.all(2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class YapIsletDevretScreen extends StatefulWidget {
  @override
  _YapIsletDevretScreenState createState() => _YapIsletDevretScreenState();
}

class _YapIsletDevretScreenState extends State<YapIsletDevretScreen> {
  String yap_islet_devret_URL_en =
      'https://udev.gama.com.tr/holding/wp-json/api/en/v1/bot/';

  String yap_islet_devret_URL_tr =
      'https://udev.gama.com.tr/holding/wp-json/api/tr/v1/bot/';

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue[900],
          ),
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
        body: new Center(
          child: new FutureBuilder<List<ProjectBOT>>(
            future: downloadJSONforBOT(
                isEng ? yap_islet_devret_URL_en : yap_islet_devret_URL_tr),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProjectBOT> projects = snapshot.data;
                return new YapIsletDevret(projects);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('HOME'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('CP'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('BOT'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[900],
          onTap: _onItemTapped,
        ),*/
      ),
    );
  }
}

Future<List<ProjectBOT>> downloadJSONforBOT(String url) async {
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();

  List projects = json.decode(reply);

  return projects.map((project) => new ProjectBOT.fromJson(project)).toList();
}
