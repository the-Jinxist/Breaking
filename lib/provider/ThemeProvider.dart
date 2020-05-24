import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;

class ThemeProvider extends ChangeNotifier{

  ThemeData _theme;

  ThemeProvider(){
    preferences.getCurrentTheme().then((string){
      if(string == Utils.LIGHT_THEME_STRING() || string == null){
        theme = Utils.getLightTheme();
        print('From Provider: $theme');
//        theme = Utils.getLightTheme();
//        preferences.setCurrentTheme(Utils.LIGHT_THEME_STRING());
        notifyListeners();
      }else{
        theme = Utils.getDarkTheme();
//        theme = Utils.getDarkTheme();
//        preferences.setCurrentTheme(Utils.DARK_THEME_STRING());
        notifyListeners();
      }
    });
  }

  get theme => _theme;

  set theme(ThemeData themeData){
    _theme = themeData;
    if(_theme == Utils.getLightTheme()){
      preferences.setCurrentTheme(Utils.LIGHT_THEME_STRING());
    }else{
      preferences.setCurrentTheme(Utils.DARK_THEME_STRING());
    }
    notifyListeners();
  }



}