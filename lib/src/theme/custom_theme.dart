import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool isDarkTheme = true;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      hoverColor: Color(0xFF1a4b6e).withOpacity(0.225),
      cardColor: Color(0xFF519259),
      primaryColor: Color(0xFF064635),
      primaryColorDark: Colors.white54,
      primaryColorLight: Colors.black,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF171c28),
      hoverColor: Color(0xFF1a4b6e),
      cardColor: Color(0xFF10576e),
      primaryColor: Color(0xFF02bbe5),
      primaryColorDark: Color(0xFF6c7582),
      primaryColorLight: Colors.white,
    );
  }
}
