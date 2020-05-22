import 'package:flutter/material.dart';
import 'package:news_app/pages/HeadlinePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/pages/ExplorePage.dart';
import 'package:news_app/pages/SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var fragmentList = [HeadlinePage(), ExplorePage(), SearchPage()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fragmentList[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(CupertinoIcons.home, size: 30),
          Icon(CupertinoIcons.collections, size: 30),
          Icon(CupertinoIcons.search, size: 30),
        ],
        onTap: (position){
          setState(() {
            currentIndex = position;
          });
        },
        index: 0,
        backgroundColor: Colors.green,
      )

//      BottomNavigationBar(items: [
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("Home")),
//          BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), title: Text("Explore")),
//        ],
//        backgroundColor: Colors.white,
//        currentIndex: currentIndex,
//        unselectedItemColor: Colors.black,
//        selectedItemColor: Colors.green,
//        onTap: (index){
//        setState(() {
//          currentIndex = index;
//        });
//        },
//      ),
    );
  }
}
