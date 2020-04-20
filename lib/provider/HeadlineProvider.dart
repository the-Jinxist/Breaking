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

  void getHeadlines() async {
    setIsLoading(true);
    var response = await NewsApi().getHeadlines();
    setIsLoading(false);
    setHeadlineModel(response);
  }


}