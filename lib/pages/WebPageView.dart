import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageView extends StatefulWidget {

  final String url;
  final String sourceName;

  WebPageView({this.url, this.sourceName});

  @override
  _WebPageViewState createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {

  WebViewController mController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${widget.sourceName}"),
        leading: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if(mController != null) mController.reload();
            },
            icon: Icon(Icons.refresh, color: Colors.black),
            color: Colors.black,
          ),

          IconButton(
            disabledColor: Colors.grey,
            onPressed: (){
              if(mController != null) mController.reload();
            },
            enableFeedback: false,
            icon: Icon(Icons.forward, color: Colors.black),
            color: Colors.black,
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (controller){
          setState(() {
            mController = controller;
          });
        },
      ),
    );
  }
}
