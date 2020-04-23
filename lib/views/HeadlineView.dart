import 'package:flutter/material.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:news_app/utils.dart';

class HeadlineView extends StatelessWidget {

  final Article headlineArticle;

  HeadlineView(this.headlineArticle);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.only(bottom: 50),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(headlineArticle.urlToImage, fit: BoxFit.cover, height: 400, scale: 1,),
            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text(headlineArticle.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 25, color: Colors.white),),
                    SizedBox(height: 3,),
                    Text(headlineArticle.description, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.white),),
                    SizedBox(height: 10,),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(headlineArticle.source.name, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 17, color: Colors.green)),
                      ],
                    )
                    )
                  ],)
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
