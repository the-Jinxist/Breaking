import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/CategoryView.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  var categoryList = ["Business", "Entertainment", "Sports", "Health", "Technology"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Explore!", style: new TextStyle(
            fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
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
            children: <Widget>[
             Text("Category", style: new TextStyle(
                 fontSize: 20.0, fontFamily: Utils.getBoldFont(), color: Colors.black /* #10db5d */
              ),
             ),
             SizedBox(height: 10,),
              GridView.count(crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              shrinkWrap: true,
                children: <Widget>[
                  CategoryView(categoryList[0]),
                  CategoryView(categoryList[1]),
                  CategoryView(categoryList[2]),
                  CategoryView(categoryList[3]),
                  CategoryView(categoryList[4]),
                ],
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
    );
  }
}
