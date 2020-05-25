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
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("${widget.sourceName}", style: Theme.of(context).textTheme.display1,),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close, ),

        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if(mController != null) mController.reload();
            },
            icon: Icon(Icons.refresh, ),

          ),

          IconButton(
            disabledColor: Colors.grey,
            onPressed: (){
              if(mController != null){
                mController.canGoBack().then((bool){
                  if(bool){
                    mController.goBack();
                  }
                });
              }
            },
            enableFeedback: false,
            icon: Icon(Icons.keyboard_arrow_left, ),

          ),

          IconButton(
            disabledColor: Colors.grey,
            onPressed: (){
              if(mController != null){
                mController.canGoForward().then((bool){
                  if(bool){
                    mController.goForward();
                  }
                });
              }
            },
            enableFeedback: false,
            icon: Icon(Icons.keyboard_arrow_right, ),

          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
              children: <Widget>[
                Expanded(child: Center(child: CircularProgressIndicator()))
              ],
          ),
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller){
              setState(() {
                mController = controller;
              });
            },
          )
        ],
      ),
    );
  }
}
