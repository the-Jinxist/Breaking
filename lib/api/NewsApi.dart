import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:news_app/utils.dart';

class NewsApi{

  Future<http.Response> getHeadlines() async{
    return http.get(Utils.getBaseApiUrl()+"top-headlines?country=us"+Utils.addApiKeyParameter());

  }

  Future<http.Response> getSources(){
    return http.get(Utils.getBaseApiUrl()+"sources?country=us&language=en"+Utils.addApiKeyParameter());
  }
  
  Future<http.Response> getPopularPosts(){
    return http.get(Utils.getBaseApiUrl()+"everything?q=corona&sortBy=popularity"+Utils.addApiKeyParameter());
  }

  Future<http.Response> getCategories(String categoryName){
    return http.get("http://newsapi.org/v2/top-headlines?country=us&catgeory=$categoryName${Utils.addApiKeyParameter()}");
  }

  Future<http.Response> getSearchResults(String searchQuery){
    return http.get(Utils.getBaseApiUrl()+"everything?q=$searchQuery&sortBy=popularity"+Utils.addApiKeyParameter());
  }

}