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
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(7),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FadeInImage.assetNetwork(placeholder: "assets/images/news_image_paceholder.png", image: headlineArticle.urlToImage, fit: BoxFit.cover, height: 200),
            Image.asset("assets/images/background_trans.png", fit: BoxFit.cover, height: 200),
            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 70,),
                      Text(headlineArticle.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 20, color: Colors.white),),
                      SizedBox(height: 3,),
                      Text(headlineArticle.description, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getFontName(), fontSize: 12, color: Colors.white),),
                      SizedBox(height: 5,),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(headlineArticle.source.name, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 10, color: Colors.green)),
                        ],
                      )
                      )
                    ],),
                )
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
