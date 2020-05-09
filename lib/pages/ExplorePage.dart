import 'package:flutter/material.dart';
import 'package:news_app/pages/CategoriesPage.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/CategoryView.dart';
import 'package:news_app/provider/SourcesProvider.dart';
import 'package:news_app/views/SourcesView.dart';
import 'package:provider/provider.dart';
import 'package:news_app/model/SourceModel.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  var categoryList = ["business", "entertainment", "sports", "health", "technology", "general", "science"];
  SourcesProvider sourceProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    sourceProvider = Provider.of<SourcesProvider>(context);
    sourceProvider.getSources();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 13, bottom: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Explore", style: new TextStyle(
                          fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.black /* #10db5d */
                      ),
                      ),
                      Text("Find news from all categories!", style: new TextStyle(
                          fontSize: 15.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
                      ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               Text("Categories", style: new TextStyle(
                   fontSize: 20.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
                ),
               ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position ) =>
                        GestureDetector(child: CategoryView(capitalize(categoryList[position])), onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage(categoryList[position])));
                        },),
                    itemCount: categoryList.length,
                    shrinkWrap: true,
                  ),
                ),
               SizedBox(height: 10,),
               Text("Sources", style: new TextStyle(
                   fontSize: 20.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
               ),
               ),
               SizedBox(height: 2,),
               loadingAccordingToProviderState(sourceProvider),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loadingAccordingToProviderState(SourcesProvider sourceProvider){
    if(sourceProvider.isLoading){
        return Container(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ) ,
        );
    }else{
      if(sourceProvider.hasError){
        return Container(
          height: 100,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.error, size: 40, color: Colors.red,),
                SizedBox(height: 2,),
                Text("Sorry, an error occured!", style: TextStyle(fontSize: 15, fontFamily: Utils.getFontName(), color: Colors.black),)
              ],
            ),
          )
        );
      }else{
        return Container(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position ) => SourcesView((sourceProvider.sources as Sources).sources[position].name,
                (sourceProvider.sources as Sources).sources[position].description),
            itemCount: ((sourceProvider.sources) as Sources).sources.length,
            shrinkWrap: true,
          ),
        );
      }
    }
  }

  List<Widget> loadWidgets(List<Source> sourceList){
    List<Widget> widgets = [];
    for(Source source in sourceList){
      var sourceView = SourcesView(source.name, source.description);
      widgets.add(sourceView);
    }

    return widgets;
  }

  String capitalize(String str){
    if(str.length > 1){
      String capitalizedString = "${str[0].toUpperCase()}${str.substring(1, str.length - 1)}";
      return capitalizedString;
    }else{
      return str.toUpperCase();
    }
  }
}
