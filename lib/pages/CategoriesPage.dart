import 'package:flutter/material.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utils.dart';

class CategoriesPage extends StatefulWidget {

  final String categoryName;

  CategoriesPage(this.categoryName);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.clear, color: Colors.black, size: 17,), onTap: () => Navigator.pop(context),),
        title: Text("${widget.categoryName[0].toUpperCase()}${widget.categoryName.substring(1, widget.categoryName.length - 1)} Category"),
      ),
      body: FutureBuilder(

          builder: (context, snapshot){
            return Container();
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
