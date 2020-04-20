import 'package:flutter/material.dart';

class Utils{

  static String getFontName(){
    return "Montesserat";
  }

  static String getBoldFont(){
    return "Montesserat-Bold";
  }

  static Color getPrimaryColor(){
    return Color.fromRGBO(16, 219, 93, 1);
  }

  static String getBaseApiUrl(){
    return "https://newsapi.org/v2/";
  }

  static String addApiKeyParameter(){
    return "&apiKey=eb061db703c74bd5a87b413029f71075";
  }

//  static String addSortParameter(){
//    return "&"
//  }

}