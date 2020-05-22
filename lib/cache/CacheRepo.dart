import 'package:sqflite/sqflite.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:path/path.dart';
import 'dart:async';

class CacheRepo{

  //Todo: Google How to add classes to the db dynamically, cause the headline model
  Future<Database> _getSearchQueriesCacheDatabase() async{
    var database = openDatabase(join( await getDatabasesPath(), "search.db"),
        onCreate: (db, version){
          return db.execute("CREATE TABLE search(id INTEGER PRIMARY KEY, searchQuery TEXT)");
        }, version: 1);

    return database;
  }

  Future<void> insertTodo(String search) async {

    var searchMap = Map<String, dynamic>();
    searchMap['searchQuery'] = search;

    var database = await _getSearchQueriesCacheDatabase();
    return database.insert("search", searchMap, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<String>> getSearchQueries() async{
    var database = await _getSearchQueriesCacheDatabase();
    final List<Map<String, dynamic>> rawList = await database.query("search");
    var searchList = List<String>();

    for(Map<String, dynamic> map in rawList){
      searchList.add(map['searchQuery'] as String);
    }

    return searchList;
  }

}