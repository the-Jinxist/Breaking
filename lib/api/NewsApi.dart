import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:news_app/model/HeadlineModel.dart';
import 'dart:convert';

import 'package:news_app/utils.dart';

class NewsApi{

  Future<HeadlineModel> getHeadlines() async{
    var response = await http.get(Utils.getBaseApiUrl()+"top-headlines?country=us"+Utils.addApiKeyParameter());
    if(response.statusCode == 200){
      var jsonBody = json.decode(response.body);
      return HeadlineModel.fromJson(jsonBody);
    }else{
      print("The Status Code is: ${response.statusCode}, ${response.body}");
      return null;
    }
  }

}