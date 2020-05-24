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

  var bool;
  @override
  void initState() {
    prefs.getCurrentTheme().then((string){
      if(string == Utils.LIGHT_THEME_STRING()){
        bool = true;
      }else{
        bool = false;
      }
    });
    super.initState();
  }

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
            Text("Light Theme", style: Theme.of(context).textTheme.title,),
            Checkbox(value: bool, onChanged: (bool){
                if(bool){
                  themeProvider.theme = Utils.getLightTheme();
                  prefs.setCurrentTheme(Utils.LIGHT_THEME_STRING());
                }else{
                  themeProvider.theme = Utils.getLightTheme();
                  prefs.setCurrentTheme(Utils.LIGHT_THEME_STRING());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
