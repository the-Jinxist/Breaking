import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  bool searchShown = false;
  LoadingStates states = LoadingStates.Idle;

  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    showSearch(context: context, delegate: NewsSearch());

    return Scaffold(
      appBar: AppBar(),

    );
  }
}

class NewsSearch extends SearchDelegate<String>{


  @override
  Widget buildSuggestions(BuildContext context) {

  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      GestureDetector(
        onTap: (){

        },
        child: Icon(Icons.search, size: 20, color: Colors.black,)
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
          onTap: (){
            this.close(context, '');
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, size: 20, color: Colors.black,)
      );
  }

  @override
  Widget buildResults(BuildContext context) {

  }
}
