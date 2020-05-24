import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/HeadlinePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/pages/ExplorePage.dart';
import 'package:news_app/pages/SearchPage.dart';
import 'package:news_app/pages/SettingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var fragmentList = [HeadlinePage(), ExplorePage(), SearchPage(), SettingsPage()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fragmentList[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Theme.of(context).backgroundColor,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: currentIndex,
        onItemSelected: (position){
          setState(() {
            currentIndex = position;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: Theme.of(context).textTheme.display2,),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore', style: Theme.of(context).textTheme.display2,),
              activeColor: Colors.green
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search', style: Theme.of(context).textTheme.display2),
              activeColor: Colors.green
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings', style: Theme.of(context).textTheme.display2),
              activeColor: Colors.green
          ),
        ],
      ),

    );
  }
}
