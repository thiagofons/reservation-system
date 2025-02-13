import 'package:flutter/material.dart';
import 'package:host_app/model/user.dart';
import 'package:host_app/service/user.dart';

class UserViewModel with ChangeNotifier {
  final UserService _userService;

  UserViewModel(this._userService);

  User? _user;
  User? get user => _user;

  /// Get all users
  Future<List<User>?> getAllUsers() async {
    final response = await _userService.getAllUsers();

    if (response != null) {
      return response;
    }
    return null;
  }

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

  /// Registers a new user
  Future<bool> signUp(String name, String email, String password) async {
    final response = await _userService.signUp(name, email, password);

    if (response != null) {
      return signIn(email, password);
    }
    return false;
  }

  /// Sign out
  void signOut() async {
    _user = null;
    notifyListeners();
  }
}
