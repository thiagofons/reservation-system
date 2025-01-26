import 'package:host_app/model/user.dart';
import 'package:host_app/repository/user.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class UserService {
  final repository = UserRepository();

  UserService();

  Future<User?> signIn(String email, String password) async {
    try {
      final user = await repository.getUserByEmailAndPassword(email, password);

      if (user == null) {
        throw Error.safeToString("👤 User Service - ❌ User not found");
      }

      logger.d("👤 User Service - ✅ User found");

      return User.fromJson(user);
    } catch (error) {
      logger.e(error);
      return null;
    }
  }

  /*
  User? signUp(String name, String email, String password) {
    try {
      return repository.signUp(name, email, password);
    } catch (error) {
      logger.e(error);
      return null;
    }
  }
  */

  void signOut() {
    try {} catch (error) {
      logger.e(error);
    }
  }
}
