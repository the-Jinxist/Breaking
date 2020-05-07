import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';

class CategoryView extends StatelessWidget {

  final String categoryText;

  CategoryView(this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      width: 130,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [BoxShadow(
          color: Colors.black12, spreadRadius: 1, blurRadius: 1, offset: Offset(-1, 0)
        )]
      ),
      child: Center(
        child: Text(categoryText, style: TextStyle(fontSize: 15, fontFamily: Utils.getFontName(), color: Colors.white),),
      ),
    );
  }
}
