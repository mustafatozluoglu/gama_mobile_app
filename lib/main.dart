import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gama_app/entities/project.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

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

class TaahhutProjeleriScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class YapIsletDevret extends StatelessWidget {
  final List<Project> projects;

  YapIsletDevret(this.projects);

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
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue[900])),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(
                    project.featured_image['thumb'],
                    height: 50.0,
                    width: 50.0,
                  ),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Row(children: <Widget>[
                  Flexible(
                      child: Column(
                    children: <Widget>[
                      new Chip(label: new Text(project.post_title)),
                      new Chip(label: new Text(project.meta_data['city']))
                    ],
                  )),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: project),
          );
          Navigator.of(context).push(route);
        });
  }
}

Future<List<Project>> downloadJSON() async {
  final response = await rootBundle.loadString('assets/data.json');

  List projects = json.decode(response);
  return projects.map((project) => new Project.fromJson(project)).toList();
}

class SecondScreen extends StatefulWidget {
  final Project value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  DetailProject createState() => DetailProject();
}

class DetailProject extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.blue[900]),
        title: appBar,
        backgroundColor: Colors.white,
      ),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                child: Image.network(widget.value.picture),
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              Padding(
                child: new Text(
                  widget.value.name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  widget.value.address,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class YapIsletDevretScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
        ),
        body: new Center(
          child: new FutureBuilder<List<Project>>(
            future: downloadJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Project> projects = snapshot.data;
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
