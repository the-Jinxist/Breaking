import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/cache/CacheRepo.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/HeadlineView.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  bool searchShown = false;
  LoadingStates states = LoadingStates.Idle;

  GlobalKey<FormState> formKey = GlobalKey();

  String searchQuery = "";

  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

//    showSearch(context: context, delegate: NewsSearch(states, searchQuery));

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Row(
                    children: <Widget>[
                      TextFormField(
                        validator: (string){
                          if(string.trim().isEmpty){
                            setState(() {
                              searchQuery = string.trim();
                            });
                            return "";
                          }else{
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.black
                        ),
                        decoration: InputDecoration(
                          hintText: "Type in your search query",
                          helperStyle: TextStyle(
                              fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.grey
                          ),
                          filled: true,
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.black, size: 20,),
                        onPressed: (){
                          bool isValidated = formKey.currentState.validate();
                          if (isValidated) {
                            setState(() {
                              states = LoadingStates.Loading;
                            });
                          }
                        }
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(70)),
      body: Container(
        height: double.maxFinite,
        color: Colors.white,
        child: states == LoadingStates.Idle ? Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.search, size: 40, color: Colors.green,),
              SizedBox(height: 5,),
              Text("Type in your query and find news on it!",
                style: TextStyle(
                  fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.black
                ),
              ),
            ],
          )
        ): states == LoadingStates.Loading ? Center(
          child: FutureBuilder(
            future: startSearchQuery(searchQuery),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var headlineModel = snapshot.data as HeadlineModel;
                return ListView.builder(
                  itemCount: headlineModel.articles.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, position){
                    return HeadlineView(headlineModel.articles[position]);
                  }
                );
              }else if(snapshot.hasError){
                return Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(child:
                      Center(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.error, size: 40, color: Colors.red,),
                              SizedBox(height: 5,),
                              Text("Sorry an error occurred: ${snapshot.error.toString()}",
                                style: TextStyle(
                                    fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.black
                                ),
                              ),
                            ],
                          )
                      )
                    )
                  ],
                );;
              }else{
                return Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(child:
                      Center(
                          child: CircularProgressIndicator()
                      )
                    )
                  ],
                );
              }
            }
          ),
        ): Container(),
      ),

    );
  }

  Future<HeadlineModel> startSearchQuery(String query) async {
    print("Loading Models");
    var response = await NewsApi().getSearchResults(query);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print("Headline Model from Search Page: $responseBody");
      return HeadlineModel.fromJson(responseBody);
    } else {
      print("Search Page Error: ${response.statusCode}");
      return null;
    }
  }
}

//
//class NewsSearch extends SearchDelegate<String>{
//
//  LoadingStates loadingStates;
//  String searchQuery;
//
//  NewsSearch(this.loadingStates, this.searchQuery);
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    return FutureBuilder(
//      future: CacheRepo().getSearchQueries(),
//      builder: (context, snapshot){
//        var searchQuery = snapshot.data as List<String>;
//        return ListView.builder(
//          itemBuilder: (context, position){
//            return ListTile(
//              onTap: (){
//                //Apply same functionality in
//              },
//              title: Text(searchQuery[position]),
//              leading: Icon(Icons.search, size: 17, color: Colors.black,),
//            ) ;
//          }
//        );
//      },
//    );
//  }
//
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    return [
//      GestureDetector(
//        onTap: (){
//          query = "";
//          loadingStates = LoadingStates.Idle;
//        },
//        child: Icon(Icons.search, size: 20, color: Colors.black,)
//      )
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    return GestureDetector(
//          onTap: (){
//            this.close(context, '');
//            Navigator.of(context).pop();
//          },
//          child: Icon(Icons.arrow_back, size: 20, color: Colors.black,)
//      );
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//
//  }
//
//}


