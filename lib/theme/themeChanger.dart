import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  get getDarkTheme => this._darkTheme;
  set setDarkTheme( bool value){
    _darkTheme = value;
    _customTheme = false;
    if (value) {
      _currentTheme = ThemeData.dark();
    }else{
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  bool get getCustomTheme => this._customTheme;
  set setCustomTheme( bool value){
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.light();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme){
    switch (theme) {
      case 1://light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2://dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3://dark
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }
}