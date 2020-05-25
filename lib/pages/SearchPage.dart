import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/cache/CacheRepo.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:news_app/pages/WebPageView.dart';
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

  String searchQuery;

  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

//    showSearch(context: context, delegate: NewsSearch(states, searchQuery));

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
        title: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          color: Theme.of(context).backgroundColor,
          child: Row(
            children: <Widget>[
              Form(
                key: formKey,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        onFieldSubmitted: (string){
                          if(string.isNotEmpty){
                            setState(() {
                              searchQuery = string.trim();
                              states = LoadingStates.Loading;
                            });
                          }
                        },
                        textInputAction: TextInputAction.search,
                        autofocus: true,
                        validator: (string){
                          if(string.trim().isEmpty){
                            return "";
                          }else{
                            setState(() {
                              searchQuery = string.trim();
                            });
                            return null;
                          }
                        },
                        style: Theme.of(context).textTheme.display2,
                        decoration: InputDecoration(
                          hintText: "Type in your search query",
                          hintStyle: TextStyle(
                              fontFamily: Utils.getFontName(), fontSize: 15, color: Colors.grey
                          ),
                          filled: true,
                          focusColor: Theme.of(context).backgroundColor,
                          fillColor: Theme.of(context).backgroundColor,

                        ),
                      ),
                    ),
                    InkWell(
                      child: IconButton(
                          icon: Icon(Icons.search, size: 20,),
                          onPressed: (){
                            bool isValidated = formKey.currentState.validate();
                            if (isValidated) {
                              setState(() {
                                states = LoadingStates.Loading;
                              });
                            }
                          }
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

//        PreferredSize(
//            child: Container(
//              padding: EdgeInsets.fromLTRB(16, 10, 5, 10),
//              color: Theme.of(context).backgroundColor,
//              child: Row(
//                children: <Widget>[
//                  Form(
//                    key: formKey,
//                    child: Row(
//                      children: <Widget>[
//                        SizedBox(
//                          width: 310,
//                          child: TextFormField(
//                            onFieldSubmitted: (string){
//                              if(string.isNotEmpty){
//                                setState(() {
//                                  searchQuery = string.trim();
//                                  states = LoadingStates.Loading;
//                                });
//                              }
//                            },
//                            textInputAction: TextInputAction.search,
//                            autofocus: true,
//                            validator: (string){
//                              if(string.trim().isEmpty){
//                                return "";
//                              }else{
//                                setState(() {
//                                  searchQuery = string.trim();
//                                });
//                                return null;
//                              }
//                            },
//                            style: Theme.of(context).textTheme.display2,
//                            decoration: InputDecoration(
//                              hintText: "Type in your search query",
//                              hintStyle: TextStyle(
//                                  fontFamily: Utils.getFontName(), fontSize: 15, color: Colors.grey
//                              ),
//                              filled: true,
//                              focusColor: Theme.of(context).backgroundColor,
//                              fillColor: Theme.of(context).backgroundColor,
//
//                            ),
//                          ),
//                        ),
//                        InkWell(
//                          child: IconButton(
//                            icon: Icon(Icons.search, size: 20,),
//                            onPressed: (){
//                              bool isValidated = formKey.currentState.validate();
//                              if (isValidated) {
//                                setState(() {
//                                  states = LoadingStates.Loading;
//                                });
//                              }
//                            }
//                          ),
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            ),
//            preferredSize: Size.fromHeight(70)
//        ),
      body: Container(
        height: double.maxFinite,
        color: Theme.of(context).backgroundColor,
        child: states == LoadingStates.Idle ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, size: 40, color: Colors.green,),
              SizedBox(height: 5,),
              Text("Type in your query and find news on it!",
                style: Theme.of(context).textTheme.display2
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

                    var headline = headlineModel.articles[position];
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebPageView(url: headline.url, sourceName: headline.source.name,))
                        );
                      },
                      child: HeadlineView(headlineModel.articles[position])
                    );
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
                                style: Theme.of(context).textTheme.display2
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
    print(query);
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

