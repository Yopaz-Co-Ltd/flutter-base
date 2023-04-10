import 'dart:convert';

import 'package:flutter_base/apis/models/user/user_model.dart';
import 'package:flutter_base/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  const UserRepository();

  Future<UserModel?> getLocalUserModel() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final userString = sharedPreferences.getString(Constants.prefsUserKey);
    if (userString == null) return null;
    return UserModel.fromJson(jsonDecode(userString));
  }

  Future<void> deleteLocalUserModel() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(Constants.prefsUserKey);
  }
}
