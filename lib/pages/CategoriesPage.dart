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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.clear, color: Colors.black, size: 17,), onTap: () => Navigator.pop(context),),
        title: Text("${categoryName[0].toUpperCase()}${categoryName.substring(1, categoryName.length - 1)} Category"),
      ),
      body: FutureBuilder(
          future: getModels(widget.categoryName),
          builder: (context, snapshot){
            var headlineModel = snapshot as HeadlineModel;
            if(headlineModel != null){
              return ListView.builder(
                itemBuilder: (context, positon) => HeadlineView(headlineModel.articles[positon]),
                itemCount: headlineModel.articles.length,
              );
            }

            return CircularProgressIndicator();
          }
        ),
    );
  }

  Future<HeadlineModel> getModels(String categoryName) async{
    var response = await http.get(Utils.getBaseApiUrl()+"everything?category=""${widget.categoryName}${Utils.addApiKeyParameter()}");
    if (response.statusCode == 200){
      var responseBody = json.decode(response.body);
      return HeadlineModel.fromJson(responseBody);
    }else{
      print(response.statusCode);
     return null;
    }
  }
}
