import 'package:flutter/material.dart';
import 'package:news_app/provider/HeadlineProvider.dart';
import 'package:news_app/utils.dart';
import 'package:provider/provider.dart';

class HeadlinePage extends StatefulWidget {
  @override
  _HeadlinePageState createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {

  var provider;

  @override
  void initState() {
    provider = Provider.of<HeadlineProvider>(context);
    provider.getHeadlines();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: 20, right: 10, left: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Headlines!", style: new TextStyle(
                  fontSize: 40.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Icon(Icons.search, color: Colors.black, size: 20,),
                    )
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 10,),
//          ListView.builder(itemBuilder: (context, position) => Container(), itemCount: ,)
        ],
      ),
    );
  }
}
