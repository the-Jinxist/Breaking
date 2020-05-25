import 'package:flutter/material.dart';

class Utils{

  static String LIGHT_THEME_STRING(){
    return "light_theme";
  }

  static String DARK_THEME_STRING(){
    return "dark_theme";
  }

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

  static List<String> getCategoryList(){
    return ["Business, Sports, Entertainment, Anime, Manga, Economy, Technology"];
  }

  static ThemeData getLightTheme(){
    return ThemeData(
        fontFamily: Utils.getFontName(),
        backgroundColor: Colors.white,
        primaryColorLight: Colors.white,
        primaryColor: Colors.white,
        splashColor: Colors.green,
        primaryColorDark: Colors.grey,
        accentColor: Colors.amber,
        iconTheme: IconThemeData(
            color: Colors.black,
            size: 15
        ),
        textTheme: TextTheme(
          title: new TextStyle(
              fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.black /* #10db5d */
          ),
          display1:  new TextStyle(
              fontSize: 20.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
          ),
          display2:  new TextStyle(
              fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
          ),
          display3:  new TextStyle(
              fontSize: 12.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
          ),
          display4:  new TextStyle(
              fontSize: 10.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
          ),
          caption: new TextStyle(
              fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.green /* #10db5d */
          ),
        )
    );
  }

  static ThemeData getDarkTheme(){
    return ThemeData(
        fontFamily: Utils.getFontName(),
        backgroundColor: Colors.black,
        primaryColorLight: Colors.black,
        primaryColor: Colors.black,
        splashColor: Colors.green,
        primaryColorDark: Colors.grey,
        accentColor: Colors.amber,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 15
        ),
        textTheme: TextTheme(
          title: new TextStyle(
              fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.white /* #10db5d */
          ),
          display1:  new TextStyle(
              fontSize: 20.0, fontFamily: Utils.getFontName(), color: Colors.white /* #10db5d */
          ),
          display2:  new TextStyle(
              fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.white /* #10db5d */
          ),
          display3:  new TextStyle(
              fontSize: 12.0, fontFamily: Utils.getFontName(), color: Colors.white /* #10db5d */
          ),
          display4:  new TextStyle(
              fontSize: 10.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
          ),
          caption: new TextStyle(
              fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.green, fontWeight: FontWeight.bold /* #10db5d */
          ),
        )
    );
  }

}

enum LoadingStates{
  Idle,
  Loading,
  Done,
  Error

}

