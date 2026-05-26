import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkTheme = false;

  Color get getBgColor {
    return isDarkTheme ? Colors.white : Colors.black;
  }

  Color get getAppBarBgColor {
    return isDarkTheme ? Colors.white : Colors.white;
  }

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
