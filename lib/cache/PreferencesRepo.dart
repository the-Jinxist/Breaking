import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _getPrefs() async{
  return await SharedPreferences.getInstance();
}

Future<String> getCurrentTheme() async {
  var prefs = await _getPrefs();
  return prefs.getString("current_theme");
}

Future<void> setCurrentTheme(String currentTheme) async {
  var prefs = await _getPrefs();
  return prefs.setString("current_theme", currentTheme);
}

Future<void> setFirstTime(String firstTime) async {
  var prefs = await _getPrefs();
  return prefs.setString("first_time", firstTime);
}

Future<String> getFirstTime() async {
  var prefs = await _getPrefs();
  return prefs.getString("first_time");
}



