import 'package:flutter/material.dart';
import 'package:host_app/model/user.dart';
import 'package:host_app/service/user.dart';

class UserProvider with ChangeNotifier {
  UserService _userService = UserService();

  UserProvider(this._userService);

  User? _user = null;
  get user => _user;

  /// Logs the user into the app
  Future<bool> signIn(String email, String password) async {
    final response = await _userService.signIn(email, password);

    if (response != null) {
      _user = response;
      notifyListeners();

      return true;
    }
    return false;
  }
}
