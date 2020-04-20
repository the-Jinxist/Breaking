import 'package:flutter/material.dart';
import 'package:news_app/pages/HeadlinePage.dart';
import 'package:news_app/utils.dart';
import 'package:provider/provider.dart';
import 'package:news_app/provider/HeadlineProvider.dart';

void main() => runApp(OnBoardingAppContainer());

class OnBoardingAppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HeadlineProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: HeadlinePage(),
      ),
    );
  }
}



class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.getPrimaryColor(),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Image.asset("assets/images/trends_trans.png", height: 200, width: 400,),
          SizedBox(height: 20,),
          Text("With the biggest news source in he world, We're bring everything you could ever need to know to your fingertips!", style:
            TextStyle(
              fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.white
            ),
          ),
          SizedBox(height: 100,),
          RaisedButton(onPressed: (){

          }, elevation: 10.0, color: Colors.white, child: Text("Leggo!", style: TextStyle(
                fontFamily: Utils.getFontName(), color: Utils.getPrimaryColor(),
              ),
            ),
          )
        ],

      ),
    );
  }
}
