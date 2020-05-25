import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/pages/WebPageView.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 27,),
        ),

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Category", style: Theme.of(context).textTheme.display2,
            ),
            Text("${capitalize(categoryName)}", style: Theme.of(context).textTheme.title
            ),

          ],
        ),
      ),

//        PreferredSize(
//          preferredSize: Size.fromHeight(80),
//          child: Container(
//            color: Theme.of(context).backgroundColor,
//            child: Padding(
//              padding: const EdgeInsets.only(left: 16,top: 13, bottom: 10, right: 10),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  GestureDetector(
//                    onTap: () => Navigator.pop(context),
//                    child: Icon(Icons.arrow_back, size: 27,),
//                  ),
//                  SizedBox(width: 20,),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Category", style: Theme.of(context).textTheme.display2,
//                      ),
//                      Text("${capitalize(categoryName)}", style: Theme.of(context).textTheme.title
//                      ),
//
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: FutureBuilder(
            future: getModels(categoryName),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var headlineModel = snapshot.data as HeadlineModel;
                if (headlineModel != null) {
                  print("Categories Page: Data dey!");
                  return ListView.builder(
                    itemBuilder: (context, position) =>
                      InkWell(
                        onTap: (){
                          var headline = headlineModel.articles[position];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WebPageView(url: headline.url, sourceName: headline.source.name,))
                          );
                        },
                        child: HeadlineView(headlineModel.articles[position])
                      ),
                    itemCount: headlineModel.articles.length,
                  );
                } else {
                  print("Categories Page: Data no dey!");
                  return Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(child:
                      Center(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.error, size: 40, color: Colors.red,),
                              SizedBox(height: 4),
                              Text("Please check your internet connection", style: Theme.of(context).textTheme.display2,)
                            ],
                          )
                      )
                      )
                    ],
                  );
                }

              }else if(snapshot.hasError){
                print("Categories Page: Error dey!");
                return Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(child:
                    Center(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.error, size: 40, color: Colors.red,),
                            SizedBox(height: 4),
                            Text("Please check your internet connection", style: Theme.of(context).textTheme.display2,)
                          ],
                        )
                    )
                    )
                  ],
                );
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
      ),
    );
  }

  Future<HeadlineModel> getModels(String categoryName) async{
    print("Loading Models");
    var response = await NewsApi().getCategories(categoryName);
    if (response.statusCode == 200){
      var responseBody = json.decode(response.body);
      print("Headline Model from Categories Page: $responseBody");
      return HeadlineModel.fromJson(responseBody);
    }else{
      print("Categories Error: ${response.statusCode}");
     return null;
    }
  }

  String capitalize(String str){
    if(str.length > 1){
      String capitalizedString = "${str[0].toUpperCase()}${str.substring(1, str.length)}";
      return capitalizedString;
    }else{
      return str.toUpperCase();
    }
  }
}
