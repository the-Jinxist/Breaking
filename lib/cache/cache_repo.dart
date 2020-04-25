import 'package:sqflite/sqflite.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:path/path.dart';
import 'dart:async';

class CacheRepo{

  //Todo: Google How to add classes to the db dynamically, cause the headline model
  Future<Database> _getAndOpenHeadlineCacheDatabase() async{
    var database = openDatabase(join( await getDatabasesPath(), "headline_cache.db"),
        onCreate: (db, version){
          return db.execute("CREATE TABLE headline(id INTEGER PRIMARY KEY, sourceName TEXT, url TEXT, urlToImage INTEGER, title TEXT, description TEXT)");
        }, version: 1);

    return database;
  }


}