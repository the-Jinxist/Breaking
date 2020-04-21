import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/model/HeadlineModel.dart';

class HeadlineProvider extends ChangeNotifier{

  bool _isLoading = true;
  HeadlineModel _model;

  HeadlineModel getHeadline(){
    return _model;
  }

  setHeadlineModel(HeadlineModel model){
    _model = model;
    notifyListeners();
  }

  bool isLoading(){
    return _isLoading;
  }

  setIsLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future getHeadlines() async {
    print(_isLoading);
    var response = await NewsApi().getHeadlines();
    setIsLoading(false);
    print(_isLoading);
    setHeadlineModel(response);
  }

  String _userName = "Loomba";

  String getName(){
    return _userName;
  }

  void setNewUserName(){
    _userName = _returnRandomName();
    print("The username now is: $_userName");
    notifyListeners();

  }

  String _returnRandomName(){
    var random = Random().nextInt(_randomListOfName.length - 1);
    return _randomListOfName[random];
  }

  var _randomListOfName = ["Larry", "Moto", "Melman", "Jack", "Keanu", "Bayo", "Grace", "Timon", "Maryanne", "Prosper", "Frank", "Neo", "Emmanuel"];


}