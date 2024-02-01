import 'package:flutter/material.dart';

class AppStateModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }
}
