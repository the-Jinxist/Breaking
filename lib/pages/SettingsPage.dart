import 'package:flutter/material.dart';
import 'package:news_app/provider/ThemeProvider.dart';
import 'package:news_app/utils.dart';
import 'package:provider/provider.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as prefs;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: double.maxFinite,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("${themeProvider.theme == Utils.getDarkTheme() ? "Dark Theme" : "Light Theme"}", style: Theme.of(context).textTheme.display1,),
            InkWell(
              onTap: (){
                if(themeProvider.theme == Utils.getDarkTheme()){
                  themeProvider.theme = Utils.getLightTheme();
                }else{
                  themeProvider.theme = Utils.getDarkTheme();
                }
              },
              child: Card(
               color: Colors.green,
               child: Container(
                 height: 100,
                 width: 200,
                 child: Center(
                   child: Text("Switch Theme", style: TextStyle(
                     color: Colors.white, fontSize: 15
                   ))),
                 ),
               ),
            ),
          ],
        ),
      ),
    );
  }
}
