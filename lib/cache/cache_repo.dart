import 'package:sqflite/sqflite.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:path/path.dart';
import 'dart:async';

class CacheRepo{

  //Todo: Google How to add classes to the db dynamically, cause the headline model
  Future<Database> _getAndOpenDatabase() async{
    var database = openDatabase(join( await getDatabasesPath(), "news_cache.db"),
        onCreate: (db, version){
          return db.execute("CREATE TABLE headline(id INTEGER PRIMARY KEY, todoDesc TEXT, todoTitle TEXT, timeInMillis INTEGER, status TEXT)");
        }, version: 1);

    return database;
  }


}