import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';

class CategoryView extends StatelessWidget {

  final String categoryText;

  CategoryView(this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.green, width: 5
        )

      ),
      child: Center(
        child: Text(categoryText, style: new TextStyle(
            color: Colors.black, fontFamily: Utils.getFontName(), fontSize: 15
          ),
        ),
      ),
    );
  }
}
