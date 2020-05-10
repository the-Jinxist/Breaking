import 'package:flutter/material.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utils.dart';
import 'package:news_app/views/HeadlineView.dart';

class CategoriesPage extends StatefulWidget {

  final String categoryName;

  CategoriesPage(this.categoryName);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

  String categoryName;

  @override
  void initState() {
    // TODO: implement initState
    categoryName = widget.categoryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 13, bottom: 10, right: 10),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.search, color: Colors.black, size: 27,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Category", style: new TextStyle(
                          fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.black, fontWeight: FontWeight.bold /* #10db5d */
                      ),
                      ),
                      Text("${capitalize(categoryName)}", style: new TextStyle(
                          fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.black /* #10db5d */
                      ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
              future: getModels(categoryName),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var headlineModel = snapshot.data as HeadlineModel;
                  if (headlineModel != null) {
                    return ListView.builder(
                      itemBuilder: (context, position) =>
                          HeadlineView(headlineModel.articles[position]),
                      itemCount: headlineModel.articles.length,
                    );
                  } else {
                    return Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(child:
                        Center(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.error, size: 40, color: Colors.red,),
                                SizedBox(height: 4),
                                Text("Please check your internet connection", style: TextStyle(color: Colors.black, fontFamily: Utils.getFontName(), fontSize: 17),)
                              ],
                            )
                        )
                        )
                      ],
                    );
                  }

                }else if(snapshot.hasError){
                  return Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(child:
                      Center(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.error, size: 40, color: Colors.red,),
                              SizedBox(height: 4),
                              Text("Please check your internet connection", style: TextStyle(color: Colors.black, fontFamily: Utils.getFontName(), fontSize: 17),)
                            ],
                          )
                      )
                      )
                    ],
                  );
                }

                return CircularProgressIndicator();
              }
            ),
        ),
      ),
    );
  }

  Future<HeadlineModel> getModels(String categoryName) async{
    var response = await http.get("${Utils.getBaseApiUrl()}everything?category=$categoryName${Utils.addApiKeyParameter()}");
    if (response.statusCode == 200){
      var responseBody = json.decode(response.body);
      return HeadlineModel.fromJson(responseBody);
    }else{
      print(response.statusCode);
     return null;
    }
  }

  String capitalize(String str){
    if(str.length > 1){
      String capitalizedString = "${str[0].toUpperCase()}${str.substring(1, str.length - 1)}";
      return capitalizedString;
    }else{
      return str.toUpperCase();
    }
  }
}
