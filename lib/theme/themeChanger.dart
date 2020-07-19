import 'package:flutter/cupertino.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;

  get getDarkTheme => this._darkTheme;
  set setDarkTheme( bool value){
    _darkTheme = value;
    _customTheme = false;
    notifyListeners();
  }

  get getCustomTheme => this._customTheme;
  set setCustomTheme( bool value){
    _darkTheme = false;
    _customTheme = value;
    notifyListeners();
  }
}