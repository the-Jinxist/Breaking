import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getThemePrefs() async{
  return await SharedPreferences.getInstance();
}

Future<String> getCurrentTheme() async {
  var prefs = await getThemePrefs();
  return prefs.getString("current_theme");
}

Future<void> setCurrentTheme(String currentTheme) async {
  var prefs = await getThemePrefs();
  return prefs.setString("current_theme", currentTheme);
}



