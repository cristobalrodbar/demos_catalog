import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        break;

      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        /* _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
        ); */

        break;

      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
      /* _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
        ); */
    } else {
      _currentTheme = ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      //_currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
      _currentTheme = ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff16202B),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary:
                  const Color(0xff48A0EB) /* , primary: Colors.white */));
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
