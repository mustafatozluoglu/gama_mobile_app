import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gama_app/entities/projectCP.dart';
import 'dart:async';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:loadmore/loadmore.dart';

import 'bottomNavigationBar.dart';
import 'detailProject.dart';
import 'main.dart';

Image appBarTr = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_tr.png"),
  height: 35.0,
);

Image appBarEn = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_en.png"),
  height: 35.0,
);

Image taahhut_en_top_pic = new Image(
  image: AssetImage('assets/images/taahhut_en_top.png'),
);

Image taahhut_tr_top_pic = new Image(
  image: AssetImage('assets/images/taahhut_tr_top.png'),
);

final List<String> countries_en = <String>[
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
final List<String> countries_tr = <String>[
  'Ülkeler',
  'Türkiye',
  'Azerbaycan',
  'Bahreyn',
  'Birleşik Arap Emirlikleri',
  'Bulgaristan',
  'Cezayir',
  'Irak',
  'İrlanda',
  'Katar',
  'Kazakistan',
  'Letonya',
  'Libya',
  'Makedonya',
  'Malezya',
  'Özbekistan',
  'Pakistan',
  'Rusya Federasyonu',
  'Suriye',
  'Suudi Arabistan',
  'Tunus',
  'Türkmenistan',
  'Ukrayna',
  'Ürdün',
  'Yemen'
];

final List<String> regions_en = <String>[
  'Regions',
  'Europe',
  'Middle East and North Africa',
  'Rusia and CIS',
  'South East Asia'
];
final List<String> regions_tr = <String>[
  'Bölgeler',
  'Avrupa',
  'Güney Doğu Asya',
  'Orta Doğu ve Kuzey Afrika',
  'Rusya ve BDT',
];

final List<String> business_en = <String>[
  'Business Lines',
  'Civil & Infrastructural Projects',
  'Hospitals, Hotels, Residentials, Business & Shopping Centers',
  'Factories',
  'Highways',
  'Dams',
  'Power Plants',
  'Thermal Power Plants',
  'Hydroelectric Power Plants',
  'Oil & Gas Projects',
  'Refineries',
  'Oil & Gas Processing Plants',
  'LNG Plants',
  'Cement Plants',
  'Petrochemical & Chemical Plants',
  'Steel & Metallurgical Plants',
  'Public Transportation Projects',
  'Water & Sewage Projects',
  'Pipelines & Material Handling Systems',
  'Steam Plants'
];
final List<String> business_tr = <String>[
  'Faaliyet Alanları',
  'İnşaat ve Alt Yapı Projeleri',
  'Hastaneler, Oteller, Konutlar, İş ve Alışveriş Merkezleri',
  'Fabrikalar',
  'Yol Projeleri',
  'Barajlar',
  'Güç Santralleri',
  'Termik Güç Santralleri',
  'Hidroelektrik Güç Santralleri',
  'Petrol ve Gaz Projeleri',
  'Rafineriler',
  'Petrol ve Gaz İşleme Tesisleri',
  'LNG Tesisleri',
  'Çimento Fabrikaları',
  'Petrokimya ve Kimya Tesisleri',
  'Demir-Çelik ve Metalurji Tesisleri',
  'Toplu Taşıma Projeleri',
  'Su ve Atıksu Projeleri',
  'Boru Hatları ve Nakil Sistemleri',
  'Buhar Üretim Tesisleri'
];

final List<String> companies_en = <String>[
  'Companies',
  'GAMA Industry',
  'GAMA International',
  'GAMA Power'
];
final List<String> companies_tr = <String>[
  'Şirketler',
  'GAMA Endüstri',
  'GAMA Güç',
  'GAMA International'
];

List<String> selectedFilters = <String>[];
List<String> selectedCompanies = <String>[];
List<String> selectedBusiness = <String>[];
List<String> selectedRegions = <String>[];
List<String> selectedCountries = <String>[];

var allProjectsList;

String searchValue;

bool isEng = true;

class TaahhutProjeleri extends StatefulWidget {
  List<ProjectCP> projects;

  TaahhutProjeleri(this.projects);

  @override
  _TaahhutProjeleriState createState() => _TaahhutProjeleriState();
}

class _TaahhutProjeleriState extends State<TaahhutProjeleri> {
  Widget build(context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.projects.length,
      itemBuilder: (context, int currentIndex) {
        return Container(
          child: Column(
            children: <Widget>[
              if (currentIndex == 0)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: TextField(
                    style: new TextStyle(height: 1.0, color: Colors.white),
                    onChanged: (value) {
                      value = value.toLowerCase();
                      searchValue = value;
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
              if (currentIndex == 0)
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton(
                    icon: Icon(
                      Icons.dehaze,
                      color: Colors.white,
                      size: 28.0,
                    ),
                    style: Theme.of(context).textTheme.body1,
                    value: isEng ? 'Filters' : 'Filtreler',
                    onChanged: (String newValue) {
                      setState(() {
                        if (selectedFilters.contains(newValue) ||
                            newValue == 'Filters' ||
                            newValue == 'Filtreler')
                          selectedFilters.remove(newValue);
                        else if ((selectedFilters.contains('Ongoing') &&
                            newValue == 'Completed')) {
                          selectedFilters.remove('Ongoing');
                          selectedFilters.add('Completed');
                        } else if ((selectedFilters.contains('Completed') &&
                            newValue == 'Ongoing')) {
                          selectedFilters.remove('Completed');
                          selectedFilters.add('Ongoing');
                        } else if ((selectedFilters.contains('Devam Eden') &&
                            newValue == 'Tamamlanan')) {
                          selectedFilters.remove('Devam Eden');
                          selectedFilters.add('Tamamlanan');
                        } else if ((selectedFilters.contains('Tamamlanan') &&
                            newValue == 'Devam Eden')) {
                          selectedFilters.remove('Tamamlanan');
                          selectedFilters.add('Devam Eden');
                        } else {
                          selectedFilters.add(newValue);
                        }
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: isEng ? "Filters" : 'Filtreler',
                        child: Text(
                          isEng ? "Filters" : "Filtreler",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: isEng ? "Ongoing" : "Devam Eden",
                        child: Text(
                          isEng ? "Ongoing" : "Devam Eden",
                          style: new TextStyle(fontSize: 12),
                        ),
                      ),
                      DropdownMenuItem(
                        value: isEng ? "Completed" : "Tamamlanan",
                        child: Text(
                          isEng ? "Completed" : "Tamamlanan",
                          style: new TextStyle(fontSize: 12),
                        ),
                      ),
                      DropdownMenuItem(
                        value: isEng ? "Companies" : "Şirketler",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value:
                              isEng ? companies_en.first : companies_tr.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selectedCompanies.contains(newValue) ||
                                  newValue == 'Companies' ||
                                  newValue == 'Şirketler') {
                                selectedCompanies.remove(newValue);
                                selectedFilters.remove(newValue);
                              } else {
                                selectedCompanies.add(newValue);
                                selectedFilters.add(newValue);
                              }
                            });
                          },
                          items: (isEng ? companies_en : companies_tr)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selectedCompanies.contains(value) &&
                                            (value != 'Companies' ||
                                                value != 'Şirketler')
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
                        value: isEng ? "Business Lines" : "Faaliyet Alanları",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: isEng ? business_en.first : business_tr.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selectedBusiness.contains(newValue) ||
                                  newValue == 'Business Lines' ||
                                  newValue ==
                                      'Civil & Infrastructural Projects' ||
                                  newValue == 'Power Plants' ||
                                  newValue == 'Oil & Gas Projects' ||
                                  newValue == 'Faaliyet Alanları' ||
                                  newValue == 'İnşaat ve Alt Yapı Projeleri' ||
                                  newValue == 'Güç Santralleri' ||
                                  newValue == 'Petrol ve Gaz Projeleri') {
                                selectedBusiness.remove(newValue);
                                selectedFilters.remove(newValue);
                              } else {
                                selectedBusiness.add(newValue);
                                selectedFilters.add(newValue);
                              }
                            });
                          },
                          items: (isEng ? business_en : business_tr)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selectedBusiness.contains(value) &&
                                            (value != 'Business Lines' ||
                                                value != 'Faaliyet Alanları')
                                        ? null
                                        : Colors.transparent,
                                  ),
                                  Text(
                                    value,
                                    style: new TextStyle(fontSize: 10.4),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      DropdownMenuItem(
                        value: isEng ? "Regions" : "Bölgeler",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value: isEng ? regions_en.first : regions_tr.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selectedRegions.contains(newValue) ||
                                  newValue == 'Regions' ||
                                  newValue == 'Bölgeler') {
                                selectedRegions.remove(newValue);
                                selectedFilters.remove(newValue);
                              } else {
                                selectedRegions.add(newValue);
                                selectedFilters.add(newValue);
                              }
                            });
                          },
                          items: (isEng ? regions_en : regions_tr)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selectedRegions.contains(value) &&
                                            (value != 'Regions' ||
                                                value != 'Bölgeler')
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
                        value: isEng ? "Countries" : "Ülkeler",
                        child: DropdownButton<String>(
                          style: Theme.of(context).textTheme.body1,
                          value:
                              isEng ? countries_en.first : countries_tr.first,
                          onChanged: (String newValue) {
                            setState(() {
                              if (selectedCountries.contains(newValue) ||
                                  newValue == 'Countries' ||
                                  newValue == 'Ülkeler') {
                                selectedCountries.remove(newValue);
                                selectedFilters.remove(newValue);
                              } else {
                                selectedCountries.add(newValue);
                                selectedFilters.add(newValue);
                              }
                            });
                          },
                          items: (isEng ? countries_en : countries_tr)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_right,
                                    color: selectedCountries.contains(value) &&
                                            (value != 'Countries' ||
                                                value != 'Ülkeler')
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
                      for (String item in selectedFilters)
                        Chip(
                          label: Text(item),
                        ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
              Container(
                child: Card(
                  child: createViewItem(widget.projects[currentIndex], context),
                  color: Colors.grey[850],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createViewItem(ProjectCP project, BuildContext context) {
    return new ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          project.featured_image[0].thumb,
        ),
      ),
      title: Text(
        project.post_title,
        style: TextStyle(
            fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        project.meta_data[0].city,
        style: TextStyle(fontSize: 10, color: Colors.white),
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



class TaahhutProjeleriScreen extends StatefulWidget {
  @override
  _TaahhutProjeleriScreenState createState() => _TaahhutProjeleriScreenState();
}

class _TaahhutProjeleriScreenState extends State<TaahhutProjeleriScreen> {
  String taahhut_projeleri_URL_en =
      'https://holding.gama.com.tr/wp-json/api/en/v1/projects/';

  String taahhut_projeleri_URL_tr =
      'https://holding.gama.com.tr/wp-json/api/tr/v1/projects/';

  @override
  Widget build(BuildContext context) {
    selectedFilters = []; // clear list before starting taahhut screen
    selectedCompanies = [];
    selectedBusiness = [];
    selectedRegions = [];
    selectedCountries = [];

    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white10,
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          iconTheme: IconThemeData(color: Colors.blue[900]),
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
        body: new Center(
          child: new FutureBuilder<List<ProjectCP>>(
            future: downloadJSONforProjects(
                isEng ? taahhut_projeleri_URL_en : taahhut_projeleri_URL_tr),
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

  /*final response = await rootBundle.loadString('assets/data.json');
  List projects = json.decode(response);*/

  allProjectsList =
      projects.map((project) => new ProjectCP.fromJson(project)).toList();

  if (searchValue != null && searchValue != "") {
    List<ProjectCP> l = searchProjectGivenString(searchValue);
    searchValue = null; // For starting constracting projects page
    if (l.isNotEmpty) return l;
  }

  if (selectedFilters.isNotEmpty) {
    return searchProjectGivenFilters();
  }

  return allProjectsList;
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

Future<List<ProjectCP>> searchProjectGivenFilters() async {
  List<ProjectCP> findedProjects = new List();
  List<ProjectCP> findedProjectsStatus = new List();
  List<ProjectCP> findedProjectsCompanies = new List();
  List<ProjectCP> findedProjectsBusiness = new List();
  List<ProjectCP> findedProjectsRegions = new List();
  List<ProjectCP> findedProjectsCountries = new List();

  for (ProjectCP p in allProjectsList) {
    String status = p.status[0].name; // ongoing or complete
    String company = p.grouping[0].name;
    String business = p.business_line[0].name;

    String region;
    int regionNo = p.country[0].parent;
    if (regionNo == 1110) region = 'Europe';
    if (regionNo == 1114) region = 'Middle East and North Africa';
    if (regionNo == 1118) region = 'Rusia and CIS';
    if (regionNo == 1122) region = 'South East Asia';

    String country = p.country[0].name;

    if (status == 'Ongoing') {
      if (selectedFilters.contains('Ongoing')) {
        findedProjectsStatus.add(p);
      }
    }

    if (status == 'Completed') {
      if (selectedFilters.contains('Completed')) {
        findedProjectsStatus.add(p);
      }
    }

    if (selectedCompanies.contains(company)) {
      findedProjectsCompanies.add(p);
    }

    if (selectedBusiness.contains(business)) {
      findedProjectsBusiness.add(p);
    }

    if (selectedRegions.contains(region)) {
      findedProjectsRegions.add(p);
    }

    if (selectedCountries.contains(country)) {
      findedProjectsCountries.add(p);
    }
  }

  findedProjects.addAll(findedProjectsStatus);

  for (ProjectCP p in findedProjectsCompanies)
    if (!findedProjects.contains(p)) findedProjects.add(p);

  for (ProjectCP p in findedProjectsBusiness)
    if (!findedProjects.contains(p)) findedProjects.add(p);

  for (ProjectCP p in findedProjectsRegions)
    if (!findedProjects.contains(p)) findedProjects.add(p);

  for (ProjectCP p in findedProjectsCountries)
    if (!findedProjects.contains(p)) findedProjects.add(p);

  for (ProjectCP p in findedProjects) {
    print(p.post_name);
  }

  return findedProjects;
}
