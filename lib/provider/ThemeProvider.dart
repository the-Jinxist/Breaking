import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;

class ThemeProvider extends ChangeNotifier{

  ThemeData _theme;

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