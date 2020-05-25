import 'package:flutter/material.dart';
import 'package:news_app/pages/WebPageView.dart';
import 'package:news_app/provider/HeadlineProvider.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/CategoryView.dart';
import 'package:news_app/views/HeadlineView.dart';
import 'package:provider/provider.dart';

class HeadlinePage extends StatefulWidget {
  @override
  _HeadlinePageState createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  var provider;
  var categoryList = Utils.getCategoryList();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<HeadlineProvider>(context);
    provider.getHeadlines();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("Headlines!", style:Theme.of(context).textTheme.title
            ),
            Text("All the top headlines from all over the world", style: Theme.of(context).textTheme.display2
            ),
            SizedBox(height:20,)
          ],
        ),
      ),

//        PreferredSize(
//          preferredSize: Size.fromHeight(80),
//          child: Container(
//            color: Theme.of(context).backgroundColor,
//            child: Padding(
//              padding: const EdgeInsets.only(left: 16,top: 13, bottom: 10, right: 10),
//              child: Row(
//                children: <Widget>[
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Headlines!", style:Theme.of(context).textTheme.title
//                      ),
//                      Text("All the top headlines from all over the world", style: Theme.of(context).textTheme.display2
//                      ),
//
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
      body: Container(
        padding: EdgeInsets.only( right: 10, left: 10),
        color: Theme.of(context).backgroundColor,
        child: loadAccordingToProviderState(provider),
      ),
    );
  }

  Widget loadAccordingToProviderState(HeadlineProvider provider){
    print(provider.isLoading());
    if (provider.isLoading()){
      return Flex(
        direction: Axis.vertical,
        children: <Widget>[
        Expanded(child: Center(child: CircularProgressIndicator()))
        ],
      );
    }else{
      if(provider.getHeadline() != null){
        return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, position) => InkWell(
              onTap: (){
                var headline = provider.getHeadline().articles[position];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebPageView(url: headline.url, sourceName: headline.source.name,))
                );
              },
              child: HeadlineView(provider.getHeadline().articles[position])
            ),
            itemCount: provider.getHeadline().articles.length);
      }else{
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error, size: 40, color: Colors.red,),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text("Check your internet connection and try again", style: Theme.of(context).textTheme.display2
                      ),
                      SizedBox(width: 5,),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

    }
  }
}
