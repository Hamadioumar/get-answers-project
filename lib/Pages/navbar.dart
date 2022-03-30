import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mytasks/Pages/Constants.dart';
import 'package:mytasks/Pages/q&a.dart';
import 'package:mytasks/TODO/Home_page.dart';

class Navigation extends StatefulWidget {
  static const String id = 'Navigation_screen';
  @override
  _NavigationState createState() => _NavigationState();
}

GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
final screens = [MyHomePage(), AnswersScreen()];
int _page = 0;

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 50,
        backgroundColor: secondColor,
        items: <Widget>[
          Icon(
            Icons.list,
            size: 30,
            color: nub4Color,
          ),
          Icon(
            Icons.chat,
            size: 30,
            color: nub4Color,
          ),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
          });
        },
      ),
      body: screens[_page],
    );
  }
}
