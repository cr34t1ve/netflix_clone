import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/downloads.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/search.dart';
import 'package:netflix_clone/screens/upcoming.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;
  final tabs = [Home(), Upcoming(), Search(), Downloads()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // unselectedIconTheme: IconThemeData(
        //   color: Colors.black
        // ),
        // selectedIconTheme: IconThemeData(
        //   color: Colors.pink,
        //   opacity: 0.5,
        //   size: 20.0
        // ),
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
          // color: Colors.white
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
          // color: Colors.white
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline_rounded), label: 'Upcoming'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined), label: 'Downloads')
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
