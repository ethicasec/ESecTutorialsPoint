import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _isDark;

  bool get darkTheme => _isDark;

  ThemeNotifier() {
    _isDark = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _isDark = !_isDark;
    _saveToPrefs();
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _isDark);
  }

  _initPrefs() async {
    // initialize shared preferences if it is null
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    //if theme key is null then by default _isDark set to be false
    _isDark = _prefs.getBool(key) ?? false;
    notifyListeners();
  }
}
