import 'package:bloved/utilities/StorageManager.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  late ThemeData _themeData = ThemeData(
      splashColor: Colors.black,
      toggleableActiveColor: Colors.pink[50],
      // primarySwatch: Colors.grey,
      hoverColor: Colors.white,
      focusColor: Colors.pink[100],
      scaffoldBackgroundColor: Colors.grey[300],
      buttonColor: Colors.pink[50],
      // primaryColor: Colors.black,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.black);

  final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    // primarySwatch: Colors.grey,
    toggleableActiveColor: Colors.pink.withOpacity(0.1),
    splashColor: Colors.grey.withOpacity(0.5),
    hoverColor: Colors.white24,
    buttonColor: Colors.white24,
    focusColor: Colors.white24,
    // primaryColor: Colors.white,
    // brightness: Brightness.dark,
    cardColor: Colors.grey[800],
    backgroundColor: Colors.grey[800],
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.grey[400],
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: Colors.white),
    //   bodyText2: TextStyle(color: Colors.white),
    // ).apply(
    //   bodyColor: Colors.white,
    //   displayColor: Colors.white,
    // ),
  );

  final lightTheme = ThemeData(
    splashColor: Colors.black,
    toggleableActiveColor: Colors.pink[50],
    // primarySwatch: Colors.grey,
    hoverColor: Colors.white,
    focusColor: Colors.pink[100],
    scaffoldBackgroundColor: Colors.grey[50],
    buttonColor: Colors.pink[50],
    // primaryColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.black,
  );

  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
