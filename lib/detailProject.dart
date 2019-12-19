
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';

import 'entities/projectCP.dart';

bool isEng = true;


Image appBarTr = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_tr.png"),
  height: 35.0,
);

Image appBarEn = new Image(
  image: new ExactAssetImage("assets/images/gama_holding_logo_en.png"),
  height: 35.0,
);

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
                          isEng ? '  Client : ' : '  İşveren : ',
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
                          isEng ? '  Contractor : ' : '  Genel Müteahhit : ',
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
                          isEng
                              ? '  Estimated Completion : '
                              : '  Tahmini Bitiş : ',
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
                            isEng ? '  Project Amount : ' : '  Proje Bedeli : ',
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
                            isEng ? '  Man-Hour : ' : '  Adam-Saat : ',
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
                            isEng ? '  Award : ' : '  Ödül : ',
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
                      child: Carousel(
                        height: 350,
                        width: 270,
                        type: "simple",
                        indicatorType: "dot",
                        arrowColor: Colors.grey,
                        axis: Axis.horizontal,
                        showArrow: true,
                        children: widget.value.gallery.map((it) {
                          return it.thumb == null
                              ? new Container(
                                  margin:
                                      new EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: new Image.asset(
                                      'assets/images/no_image.png'))
                              : new Container(
                                  margin:
                                      new EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: new Image.network(it.thumb));
                        }).toList(),
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