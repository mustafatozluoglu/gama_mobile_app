import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottomNavigationBar.dart';
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

String searchValue;

List<ProjectCP> allProjectsList;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: new AppBar(
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
                  onPressed: () {},
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              style: new TextStyle(height: 1.0, color: Colors.white),
              onChanged: (value) {
                value = value.toLowerCase();
                searchValue = value;
                downloadJSONforProjects(isEng
                    ? 'https://holding.gama.com.tr/wp-json/api/en/v1/projects/'
                    : 'https://holding.gama.com.tr/wp-json/api/tr/v1/projects/');
                searchProjectGivenString(searchValue);
                value = '';
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: isEng ? "Search" : "Arama",
                labelStyle: TextStyle(color: Colors.white),
                hintText: isEng ? "Search" : "Arama",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<ProjectCP> searchProjectGivenString(String s) {
  List<ProjectCP> findedProjects = new List();

  for (ProjectCP p in allProjectsList) {
    String post_date = p.post_date.toLowerCase();
    String post_content = p.post_content.toLowerCase();
    String post_title = p.post_title.toLowerCase();
    String post_name = p.post_name.toLowerCase();
    String post_city = p.meta_data[0].city.toLowerCase();
    String post_year = p.meta_data[0].year.toLowerCase();
    String post_main_contractor = p.meta_data[0].main_contractor.toLowerCase();
    String post_country = p.country[0].name.toLowerCase();
    String post_bussiness_line_name = p.business_line[0].name.toLowerCase();
    String post_grouping_name = p.grouping[0].name.toLowerCase();

    if (post_date.contains(s) ||
        post_content.contains(s) ||
        post_title.contains(s) ||
        post_name.contains(s) ||
        post_city.contains(s) ||
        post_year.contains(s) ||
        post_main_contractor.contains(s) ||
        post_country.contains(s) ||
        post_bussiness_line_name.contains(s) ||
        post_grouping_name.contains(s)) {
      findedProjects.add(p);
    }
  }

  return findedProjects;
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

  /*final response = await rootBundle.loadString('assets/data.json');
  List projects = json.decode(response);*/

  allProjectsList =
      projects.map((project) => new ProjectCP.fromJson(project)).toList();

  if (searchValue != null && searchValue != "") {
    List<ProjectCP> l = searchProjectGivenString(searchValue);
    searchValue = null; // For starting constracting projects page
    if (l.isNotEmpty) return l;
  }

  allProjectsList.sort((a, b) {
    // alphabetical order for all projects
    return a.post_name.compareTo(b.post_name);
  });

  return allProjectsList;
}
