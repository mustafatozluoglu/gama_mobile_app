import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gama_app/companies.dart';
import 'package:gama_app/search.dart';
import 'package:gama_app/taahhut.dart';

import 'contact.dart';
import 'generalApplication.dart';
import 'main.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    CompaniesScreen(),
    ContactScreen()
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
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),
        child: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.white60,
          fixedColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('HOME'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text('SEARCH'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.compare),
              title: new Text('COMPANIES'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.view_stream),
              title: new Text('CONTACT'),
            ),
          ],
        ),
      ),
    );
  }
}
