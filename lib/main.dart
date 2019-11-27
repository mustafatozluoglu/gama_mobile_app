import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gama_app/entities/project.dart';
import 'package:gama_app/entities/botProject.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:x509csr/x509csr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:http/http.dart' as http;

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
Image yapisletdevret = new Image(
  image: AssetImage('assets/images/yapisletdevret_top.jpg'),
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
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 75.0),
            child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("PROJELER"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjelerScreen()),
                  );
                }), // button projeler
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 75.0),
            child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("IK"),
                onPressed: () {}), // button ik
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 75.0),
            child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("GENEL BASVURU"),
                onPressed: () {}), // button genel basvuru
          )
        ]),
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
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("Taahhüt Projeleri"),
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
                textColor: Colors.white,
                color: Colors.blue[900],
                child: Text("Yap İşlet Devret"),
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

class TaahhutProjeleri extends StatelessWidget {
  final List<Project> projects;

  TaahhutProjeleri(this.projects);

  Widget build(context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(projects[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Project project, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 5.0,
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
                            project.meta_data[0].city,
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
              new SecondScreenProjeler(value: project),
        );
        Navigator.of(context).push(route);
      },
    );
  }
}

class SecondScreenProjeler extends StatefulWidget {
  final Project value;

  SecondScreenProjeler({Key key, this.value}) : super(key: key);

  @override
  DetailProject createState() => DetailProject();
}

class DetailProject extends State<SecondScreenProjeler> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.blue[900]),
        title: appBar,
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
                          '  Location : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                            child: Text(widget.value.meta_data[0].city +
                                ', ' +
                                widget.value.country[0].name)),
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/client.png',
                          height: 30,
                        ),
                        Text(
                          '  Client : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                            child: Text(widget.value.meta_data[0].employer))
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/contractor.png',
                          height: 30,
                        ),
                        Text(
                          '  Contractor : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          widget.value.meta_data[0].main_contractor,
                        ))
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/estimated.png',
                          height: 30,
                        ),
                        Text(
                          '  Estimated Completion : ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                            child: Text(widget.value.meta_data[0].expected_end))
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: CarouselSlider(
                          items: widget.value.gallery.map((it) {
                            return new Container(
                              margin: new EdgeInsets.symmetric(horizontal:5.0),
                              child: new Image.network(it.thumb),
                            );
                          }).toList(),
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 90, 20, 10),
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

class TaahhutProjeleriScreen extends StatelessWidget {
  String taahhut_projeleri_URL =
      'https://udev.gama.com.tr/holding/wp-json/api/en/v1/projects';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.blue[900],
          ),
        ),
        body: new Center(
          child: new FutureBuilder<List<Project>>(
            future: downloadJSONforProjects(taahhut_projeleri_URL),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Project> projects = snapshot.data;
                return new TaahhutProjeleri(projects);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class YapIsletDevret extends StatelessWidget {
  final List<ProjectBOT> projects;

  YapIsletDevret(this.projects);

  Widget build(context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(projects[currentIndex], context);
      },
    );
  }

  Widget createViewItem(ProjectBOT project, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 5.0,
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
        title: appBar,
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
                          '  Location : ',
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
                          '  Commercial Operations : ',
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
                          '  Concession Period : ',
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
                          '  Investment Amount : ',
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

class YapIsletDevretScreen extends StatelessWidget {
  String yap_islet_devret_URL =
      'https://udev.gama.com.tr/holding/wp-json/api/en/v1/bot/';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.blue[900],
          ),
        ),
        body: new Center(
          child: new FutureBuilder<List<ProjectBOT>>(
            future: downloadJSONforBOT(yap_islet_devret_URL),
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
      ),
    );
  }
}

class Constants {
  static const String projeler = 'Projeler';
  static const String ik = 'IK';
  static const String genelBasvuru = 'Genel Başvuru';

  static const List<String> choices = <String>[projeler, ik, genelBasvuru];
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

Future<List<Project>> downloadJSONforProjects(String url) async {
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();

  List projects = json.decode(reply);

  var list = projects.map((project) => new Project.fromJson(project)).toList();

  return list;
}
