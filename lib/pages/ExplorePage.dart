import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/CategoryView.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  var categoryList = ["Business", "Entertainment", "Sports", "Health", "Technology", "General", "Science"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 13, bottom: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Explore", style: new TextStyle(
                          fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.black /* #10db5d */
                      ),
                      ),
                      Text("Find news from all categories!", style: new TextStyle(
                          fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
                      ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 20, top: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               Text("Categories", style: new TextStyle(
                   fontSize: 20.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
                ),
               ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position ) => CategoryView(categoryList[position]),
                    itemCount: categoryList.length,
                    shrinkWrap: true,
                  ),
                ),
//            ListView.builder(
//              scrollDirection: Axis.horizontal,
//                shrinkWrap: true,
//                itemCount: categoryList.length,
//                itemBuilder: (context, position) => GestureDetector(child: CategoryView(categoryList[position]),
//                onTap: (){
//                  print("Category: ${categoryList.length}");
//                },
//              )
//            ),
               SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
