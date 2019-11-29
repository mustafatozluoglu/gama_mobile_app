import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

Image appBar = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo.jpg"),
  height: 35.0,
);
Image taahhut_en_top_pic = new Image(
  image: AssetImage('assets/images/taahhut_en_top.png'),
);

class TaahhutProjeleri extends StatelessWidget {
  final List<ProjectCP> projects;

  TaahhutProjeleri(this.projects);

  Widget build(context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, int currentIndex) {
        return Container(
          child: Column(
            children: <Widget>[
              if (currentIndex == 0) taahhut_en_top_pic,
              Container(
                child: createViewItem(projects[currentIndex], context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createViewItem(ProjectCP project, BuildContext context) {
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
  final ProjectCP value;

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
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.grey),
                              child: new Image.network(it.thumb),
                            );
                          }).toList(),
                          enableInfiniteScroll: true,
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
          child: new FutureBuilder<List<ProjectCP>>(
            future: downloadJSONforProjects(taahhut_projeleri_URL),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProjectCP> projects = snapshot.data;
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

Future<List<ProjectCP>> downloadJSONforProjects(String url) async {
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();

  List projects = json.decode(reply);

  var list =
      projects.map((project) => new ProjectCP.fromJson(project)).toList();

  return list;
}

class Constants {
  static const String projeler = 'Projeler';
  static const String ik = 'IK';
  static const String genelBasvuru = 'Genel Başvuru';

  static const List<String> choices = <String>[projeler, ik, genelBasvuru];
}
