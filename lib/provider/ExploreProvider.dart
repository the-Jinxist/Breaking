import 'package:flutter/material.dart';
import 'package:news_app/api/NewsApi.dart';
import 'package:news_app/model/SourceModel.dart';
import 'dart:convert';
import 'package:news_app/model/Error.dart';
import 'package:news_app/model/HeadlineModel.dart';

class ExploreProvider extends ChangeNotifier{

  bool _isLoading = true;
  Sources _sources;
  bool _hasError = false;

  bool _isPopularLoading = true;
  HeadlineModel _popularModel;
  bool _popularHasError = false;

  Error _error;
  Error _popularError;

  set sources(sources){
    _sources = sources;
    notifyListeners();
  }

  set popular(model){
    _popularModel = model;
    notifyListeners();
  }

  get sources => _sources;

  get popular => _popularModel;

  set hasError(bool value){
    _hasError = value;
    notifyListeners();
  }

  set popularHasError(value){
    _popularHasError = value;
    notifyListeners();
  }

  get hasError => _hasError;

  get popularHasError => _popularHasError;

  set isLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }

  set popularIsLoading(loading){
    _isPopularLoading = loading;
    notifyListeners();
  }

  set error(Error error){
    _error = error;
    notifyListeners();
  }

  set popularError(Error error){
    _popularError = error;
    notifyListeners();
  }

  get error => _error;

  get popularError => _popularError;

  get isLoading => _isLoading;

  get popularIsLoading => _isPopularLoading;

  Future getSources() async {
    if(isLoading){
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

        print("Explore Provider - Categories Error: $e");

        isLoading = false;
        hasError = true;

        error = Error(123);
      }
    }

  }

  Future getPopularPosts() async {

    if(popularIsLoading){
      try{
        var response  = await NewsApi().getPopularPosts();
        if (response.statusCode == 200){
          var jsonBody = json.decode(response.body);
          popular = HeadlineModel.fromJson(jsonBody);

          print("From Explore Provider: " + (popular as HeadlineModel).articles[3].description);
          popularIsLoading = false;
          popularHasError = false;
        }else{
          popularIsLoading = false;
          popularHasError = true;

          popularError = Error(response.statusCode);
          print("Explore Provider - Popular Error: ${response.statusCode}");
        }
      }catch(e){

        print("Explore Provider - Popular Error: $e");

        popularIsLoading = false;
        popularHasError = true;

        error = Error(123);
      }
    }

  }

}