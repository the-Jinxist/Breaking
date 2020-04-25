import 'package:flutter/material.dart';
import 'package:news_app/pages/HeadlinePage.dart';
import 'package:news_app/pages/ExplorePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var fragmentList = [HeadlinePage(), ExplorePage()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fragmentList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text("Explore")),
        ],
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
        onTap: (index){
        setState(() {
          currentIndex = index;
        });
        },
      ),
    );
  }
}
