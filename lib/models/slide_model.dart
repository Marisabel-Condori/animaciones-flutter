import 'package:flutter/material.dart';

class SlideModel with ChangeNotifier{
  double _numPag = 0;

  get getNumPag => this._numPag;

  set setNumPag(double nro){
    _numPag = nro;
    notifyListeners();
  }
}