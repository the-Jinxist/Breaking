import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';

class CategoryView extends StatelessWidget {

  final String categoryText;

  CategoryView(this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.black12, spreadRadius: 1, blurRadius: 1, offset: Offset(-1, 0)
        )]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(categoryText, style: new TextStyle(
              color: Colors.white, fontFamily: Utils.getFontName(), fontSize: 15,
          ),
          ),
        ),
      ),
    );
  }
}
