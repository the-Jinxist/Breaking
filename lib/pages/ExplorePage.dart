import 'package:flutter/material.dart';
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

  var categoryList = ["Business", "Entertainment", "Sports", "Health", "Technology", "General", "Science"];
  SourcesProvider sourceProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    sourceProvider = Provider.of<SourcesProvider>(context, listen: false);
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
            padding: EdgeInsets.only(left: 15, right: 20, top: 10),
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
                    itemBuilder: (context, position ) => CategoryView(categoryList[position]),
                    itemCount: categoryList.length,
                    shrinkWrap: true,
                  ),
                ),
               SizedBox(height: 10,),
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
          height: 200,
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
        return GridView.count(
          children: loadWidgets((sourceProvider.sources as Sources).sources),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
          crossAxisCount: categoryList.length,
          shrinkWrap: true,
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
}
