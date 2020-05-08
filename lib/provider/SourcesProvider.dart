import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/model/SourceModel.dart';
import 'dart:convert';
import 'package:news_app/model/Error.dart';

class SourcesProvider extends ChangeNotifier{

  bool _isLoading = true;
  Sources _sources;
  bool _hasError = false;

  Error _error;

  set sources(Sources sources){
    _sources = sources;
    notifyListeners();
  }

  get sources => _sources;

  set hasError(bool value){
    _hasError = value;
    notifyListeners();
  }

  get hasError => _hasError;

  set isLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }

  set error(Error error){
    _error = error;
    notifyListeners();
  }

  get error => _error;

  get isLoading => _isLoading;

  Future getSources() async {
    try{
      var response  = await NewsApi().getSources();
      if (response.statusCode == 200){
        var jsonBody = json.decode(response.body);
        sources = Sources.fromJson(jsonBody);
        isLoading = false;
        hasError = false;
      }else{
        isLoading = false;
        hasError = true;

        error = Error(response.statusCode);
      }
    }catch(e){
      isLoading = false;
      hasError = true;

      error = Error(123);
    }

  }

}