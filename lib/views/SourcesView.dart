import 'package:flutter/material.dart';

import '../utils.dart';

class SourcesView extends StatelessWidget {

  final String sourceName;
  final String sourceDescription;

  SourcesView(this.sourceName, this.sourceDescription);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: 100,
      height: 150,
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 20,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(sourceName, style: TextStyle(color: Colors.white, fontFamily: Utils.getBoldFont(), fontSize: 17), ),
              Text(sourceDescription, style: TextStyle(color: Colors.white, fontFamily: Utils.getFontName(), fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}
