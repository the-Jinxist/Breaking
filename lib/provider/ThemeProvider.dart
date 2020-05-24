import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;

class ThemeProvider extends ChangeNotifier{

  ThemeData _theme;

  ThemeProvider(){
    preferences.getCurrentTheme().then((string){
      if(string == Utils.DARK_THEME_STRING()){
        _theme = Utils.getDarkTheme();
        notifyListeners();
      }else{
        _theme = Utils.getDarkTheme();
        notifyListeners();
      }
    });
  }

  get theme => _theme;

  set theme(ThemeData themeData){
    _theme = themeData;
    notifyListeners();
  }



}