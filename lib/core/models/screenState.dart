import 'package:flutter/material.dart';

class ScreenState with ChangeNotifier {

  bool _floatBtnState = false;

  bool get floatBtnState => _floatBtnState;

  set floatBtnState(bool val) {
    _floatBtnState = val;
    notifyListeners();
  }
}