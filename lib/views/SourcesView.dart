import 'package:flutter/material.dart';

import '../utils.dart';

class SourcesView extends StatelessWidget {

  final String sourceName;
  final String sourceDescription;

  SourcesView(this.sourceName, this.sourceDescription);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Container(
        width: 200,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(sourceName, style: TextStyle(color: Colors.white, fontFamily: Utils.getBoldFont(), fontSize: 20), ),
                Text(sourceDescription, style:
                TextStyle(color: Colors.white, fontFamily: Utils.getFontName(), fontSize: 12,), maxLines: 3, textAlign: TextAlign.center,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
