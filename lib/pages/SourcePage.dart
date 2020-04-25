import 'package:flutter/material.dart';
import 'package:news_app/utils.dart';

class SourcePage extends StatefulWidget {
  @override
  _SourcePageState createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Text("Sources", style: new TextStyle(
                fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
              ),
            ),
            Text("A list of our trusted sources...", style: new TextStyle(
                fontSize: 20.0, fontFamily: Utils.getFontName(), color: Colors.black /* #10db5d */
              ),
            ),
          ],
        ),
      ),

    );
  }
}
