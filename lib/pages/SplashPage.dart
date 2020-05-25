import 'package:flutter/material.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;
import 'package:news_app/main.dart';
import 'package:news_app/pages/HomePage.dart';
import 'package:news_app/provider/ThemeProvider.dart';
import 'package:news_app/utils.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  var hasLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(!hasLoaded){

      var themeProvider = Provider.of<ThemeProvider>(context);

      preferences.getCurrentTheme().then((string){
        if(string == Utils.LIGHT_THEME_STRING() || string == null){
          themeProvider.theme =Utils.getLightTheme();
        }else{
          themeProvider.theme =Utils.getDarkTheme();
        }

        preferences.getFirstTime().then((string){
          if(string == null){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingPage()));
          }else{
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          }

          hasLoaded = true;
        });

      });

    }

    return Scaffold(
      body: Image.asset("assets/images/news_app_splash.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      )
    );
  }
}
