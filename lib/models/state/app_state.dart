import 'package:flutter/material.dart';
import 'package:project_base/utils/constants.dart';
import 'package:project_base/utils/local_storage_helper.dart';

class AppStateModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  void checkLoginState() {
    final accessToken =
        LocalStorageHelper.getString(Constants.prefsAccessToken);
    _isLoggedIn = accessToken.isNotEmpty;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    LocalStorageHelper.remove(Constants.prefsAccessToken);
    LocalStorageHelper.remove(Constants.prefsEmail);
    notifyListeners();
  }
}
