import 'package:bloved/utilities/StorageManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeNotifier with ChangeNotifier {
  late ThemeData _themeData = ThemeData(
      splashColor: Colors.black,
      toggleableActiveColor: Colors.pink[50],
      // primarySwatch: Colors.grey,
      hoverColor: Colors.white,
      focusColor: Colors.pink[100],
      scaffoldBackgroundColor: Colors.grey[300],
      buttonColor: Color(0XFFFBF6F7),
      // primaryColor: Colors.black,
      brightness: Brightness.light,
      backgroundColor: Color(0XFF1C1C1E),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      dividerColor: Colors.black);

  final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      // primarySwatch: Colors.grey,
      toggleableActiveColor: Colors.pink.withOpacity(0.1),
      splashColor: Color(0xffffffff),
      hoverColor: Colors.white24,
      buttonColor: Color(0XFF555557),
      focusColor: Colors.white24,
      cardColor: Colors.grey[800],
      backgroundColor: Color(0XFF1C1C1E),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.grey[400],
      fontFamily: GoogleFonts.ubuntu().fontFamily);

  final lightTheme = ThemeData(
      splashColor: Color(0xff7a869a),
      toggleableActiveColor: Colors.pink[50],
      // primarySwatch: Colors.grey,
      hoverColor: Colors.white,
      focusColor: Colors.pink[100],
      scaffoldBackgroundColor: Color(0xfffbf6f7),
      buttonColor: Color(0XFFFBF6F7),
      brightness: Brightness.light,
      backgroundColor: Color(0XFFFFFFFF),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.black,
      fontFamily: GoogleFonts.ubuntu().fontFamily);

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
