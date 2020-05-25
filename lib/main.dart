import 'package:flutter/material.dart';
import 'package:news_app/pages/HomePage.dart';
import 'package:news_app/pages/SplashPage.dart';
import 'package:news_app/provider/HeadlineProvider.dart';
import 'package:news_app/provider/ExploreProvider.dart';
import 'package:news_app/provider/ThemeProvider.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: HeadlineProvider()),
          ChangeNotifierProvider.value(
              value: ExploreProvider()),
          ChangeNotifierProvider.value(
              value: ThemeProvider()),
        ],
        child: OnBoardingAppContainer(),
      )
    );

class OnBoardingAppContainer extends StatelessWidget {

  bool hasLoaded = false;

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);

//    if(!hasLoaded){
//      preferences.getCurrentTheme().then((string){
//        if(string == Utils.LIGHT_THEME_STRING()){
//          themeProvider.theme =Utils.getLightTheme();
//          hasLoaded = true;
//        }else{
//          themeProvider.theme =Utils.getDarkTheme();
//          hasLoaded = true;
//        }
//      });
//
//      print('From main: ${themeProvider.theme}');
//    }

    return MaterialApp(
//      themeMode: themeProvider.theme == null ? ThemeMode.light: ThemeMode.dark,
      title: "Breaking!",
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme == null ? Utils.getLightTheme() : themeProvider.theme,
      debugShowMaterialGrid: false,
      home: SplashPage()

//      FutureBuilder(
//        future: preferences.getFirstTime(),
//        builder: (context, snapshot){
//            if(snapshot.data == null){
//              return OnBoardingPage();
//            }else{
//              return HomePage();
//            }
//          }
//        ),
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Image.asset("assets/images/happy_imageii.jpg", height: 200, width: 400,),
            SizedBox(height: 5,),
            Text("With the biggest news source in he world, We're bring everything you could ever need to know to your fingertips!", style:
              TextStyle(
                fontFamily: Utils.getFontName(), fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100,),
            InkWell(
              onTap: (){
                preferences.setFirstTime("first_time");
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Card(
                color: Colors.green,
                elevation: 5,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Leggo!", style: TextStyle(
                      fontFamily: Utils.getFontName(), color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
