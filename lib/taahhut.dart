import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';

Image appBar = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo.jpg"),
  height: 35.0,
);
Image taahhut_en_top_pic = new Image(
  image: AssetImage('assets/images/taahhut_en_top.png'),
);

final List<String> countries = <String>[
  'Countries',
  'Turkey',
  'Algeria',
  'Azerbaijan',
  'Bahrain',
  'Bulgaria',
  'Iraq',
  'Ireland',
  'Jordan',
  'Kazakhstan',
  'Latvia',
  'Libya',
  'Macedonia',
  'Malaysia',
  'Pakistan',
  'Qatar',
  'Russian Federation',
  'Saudi Arabia',
  'Syria',
  'Tunisia',
  'Turkmenistan',
  'UAE',
  'Ukraine',
  'Uzbekistan',
  'Yemen'
];

final List<String> regions = <String>[
  'Regions',
  'Europe',
  'Middle East and North Africa',
  'Rusia and CIS',
  'South East Asia'
];

final List<String> business = <String>[
  'Business Lines',
  'Civil & Infrastructural Project',
  'Power Plants',
  'Oil & Gas Projects',
  'Cement Plants',
  'Petrochemical & Chemical Plants',
  'Steel & Metallurgical Plants',
  'Public Transportation Projects',
  'Water & Sewage projects',
  'Pipelines & Material Handling Systems',
  'Steam Plants'
];

final List<String> companies = <String>[
  'Companies',
  'GAMA Industry',
  'GAMA International',
  'GAMA Power'
];

List<String> selected = <String>[];

var allProjectsList;

String searchValue;

class TaahhutProjeleri extends StatefulWidget {
  List<ProjectCP> projects;

  TaahhutProjeleri(this.projects);

  @override
  _TaahhutProjeleriState createState() => _TaahhutProjeleriState();
}

class _TaahhutProjeleriState extends State<TaahhutProjeleri> {
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.projects.length,
      itemBuilder: (context, int currentIndex) {
        return Container(
          child: Column(
            children: <Widget>[
              if (currentIndex == 0) taahhut_en_top_pic,
              if (currentIndex == 0)
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton(
                    icon: Icon(
                      Icons.dehaze,
                      color: Colors.blue[900],
                      size: 28.0,
                    ),
                    style: Theme.of(context).textTheme.body1,
                    value: 'Filters',
                    onChanged: (String newValue) {
                      setState(() {
                        if (selected.contains(newValue) ||
                            newValue == 'Filters')
                          selected.remove(newValue);
                        else if ((selected.contains('Ongoing') &&
                            newValue == 'Completed')) {
                          selected.remove('Ongoing');
                          selected.add('Completed');
                        } else if ((selected.contains('Completed') &&
                            newValue == 'Ongoing')) {
                          selected.remove('Completed');
                          selected.add('Ongoing');
                        } else
                          selected.add(newValue);
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: "Filters",
                        child: Text(
                          "Filters",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Ongoing",
                        child: Text(
                          "Ongoing",
                          style: new TextStyle(fontSize: 12),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Completed",
                        child: Text(
                          "Completed",
                          style: new TextStyle(fontSize: 12),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Companies",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: companies.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selected.contains(newValue) ||
                                  newValue == 'Companies')
                                selected.remove(newValue);
                              else
                                selected.add(newValue);
                            });
                          },
                          items: companies
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selected.contains(value) &&
                                            value != 'Companies'
                                        ? null
                                        : Colors.transparent,
                                  ),
                                  Text(
                                    value,
                                    style: new TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Business Lines",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: business.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selected.contains(newValue) ||
                                  newValue == 'Business Lines')
                                selected.remove(newValue);
                              else
                                selected.add(newValue);
                            });
                          },
                          items: business
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selected.contains(value) &&
                                            value != 'Business Lines'
                                        ? null
                                        : Colors.transparent,
                                  ),
                                  Text(
                                    value,
                                    style: new TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Regions",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: regions.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selected.contains(newValue) ||
                                  newValue == 'Regions')
                                selected.remove(newValue);
                              else
                                selected.add(newValue);
                            });
                          },
                          items: regions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selected.contains(value) &&
                                            value != 'Regions'
                                        ? null
                                        : Colors.transparent,
                                  ),
                                  Text(
                                    value,
                                    style: new TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Countries",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: countries.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selected.contains(newValue) ||
                                  newValue == 'Countries')
                                selected.remove(newValue);
                              else
                                selected.add(newValue);
                            });
                          },
                          items: countries
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selected.contains(value) &&
                                            value != 'Countries'
                                        ? null
                                        : Colors.transparent,
                                  ),
                                  Text(
                                    value,
                                    style: new TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              if (currentIndex == 0)
                Padding(
                  child: Column(
                    children: <Widget>[
                      for (String item in selected)
                        Chip(
                          label: Text(item),
                        ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
              if (currentIndex == 0)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    style: new TextStyle(height: 1.0),
                    onChanged: (value) {
                      value = value.toLowerCase();
                      searchValue = value;
                      value = '';
                    },
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                child: createViewItem(widget.projects[currentIndex], context),
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
        elevation: 10.0,
        child: new Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[900]),
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(8.0),
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
                        if (widget.value.meta_data[0].expected_end != "")
                          Expanded(
                            child: Text(widget.value.meta_data[0].expected_end),
                          )
                        else
                          Expanded(
                            child: Text(widget.value.meta_data[0].duration),
                          )
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  if (widget.value.meta_data[0].price != "")
                    Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/amount.png',
                            height: 30,
                          ),
                          Text(
                            '  Project Amount : ',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Text(widget.value.meta_data[0].price))
                        ],
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  if (widget.value.meta_data[0].man_hour != "")
                    Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/man_hour.png',
                            height: 30,
                          ),
                          Text(
                            '  Man-Hour : ',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                              child: Text(widget.value.meta_data[0].man_hour))
                        ],
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  if (widget.value.meta_data[0].awards.length != 0)
                    Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/award.png',
                            height: 30,
                          ),
                          Text(
                            '  Award : ',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                              child: Text(widget.value.meta_data[0].awards[0]))
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
                            return it.thumb == null
                                ? new Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: new Image.asset(
                                        'assets/images/no_image.png'))
                                : new Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: new Image.network(it.thumb));
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

class TaahhutProjeleriScreen extends StatefulWidget {
  @override
  _TaahhutProjeleriScreenState createState() => _TaahhutProjeleriScreenState();
}

class _TaahhutProjeleriScreenState extends State<TaahhutProjeleriScreen> {
  String taahhut_projeleri_URL =
      'https://udev.gama.com.tr/holding/wp-json/api/en/v1/projects';

  @override
  Widget build(BuildContext context) {
    selected = []; // clear list before starting taahhut screen

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: appBar,
          backgroundColor: Colors.white,
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

  allProjectsList =
      projects.map((project) => new ProjectCP.fromJson(project)).toList();

  if (searchValue != null && searchValue != "") {
    Future<List<ProjectCP>> l =
        searchProjectGivenString(searchValue);
    searchValue = null; // For starting projects page
    return l;
  }

  if (selected.isNotEmpty) {
    return searchProjectGivenFilters(selected);
  }

  return allProjectsList;
}

Future<List<ProjectCP>> searchProjectGivenString(String s) async {
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

Future<List<ProjectCP>> searchProjectGivenFilters(
    List<String> filtersList) async {
  List<ProjectCP> findedProjects = new List();

  for (ProjectCP p in allProjectsList) {
    for (String filter in filtersList) {
      filter = filter.toLowerCase();

      String ongoing = p.status[0].name.toLowerCase();
      String company = p.grouping[0].name.toLowerCase();
      String business = p.business_line[0].name.toLowerCase();

      String region;
      int regionNo = p.country[0].parent;
      if (regionNo == 1110) region = 'Europe';
      if (regionNo == 1114) region = 'Middle East and North Africa';
      if (regionNo == 1118) region = 'Rusia and CIS';
      if (regionNo == 1122) region = 'South East Asia';

      String country = p.country[0].name.toLowerCase();

      if (ongoing.contains(filter) ||
          company.contains(filter) ||
          business.contains(filter) ||
          region.contains(filter) ||
          country.contains(filter)) {
        findedProjects.add(p);
      }
    }
  }

  return findedProjects;
}
