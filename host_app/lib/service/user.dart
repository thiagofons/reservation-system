import 'package:host_app/model/user.dart';
import 'package:host_app/repository/user.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class UserService {
  final repository = UserRepository();

  UserService();

  Future<List<User>?> getAllUsers() async {
    try {
      final users = await repository.getAllUsers();

      if (users.isEmpty) {
        throw Error.safeToString("👤 User Service - ❌ Users not found");
      }

      logger.d("👤 User Service - ✅ Users found");

      return users.map((user) => User.fromJson(user)).toList();
    } catch (error) {
      logger.e(error);
      return null;
    }
  }

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

  Future<User?> signUp(String name, String email, String password) async {
    try {
      final user = await repository.createUser(name, email, password);

      if (user == null) {
        throw Error.safeToString("👤 User Service - ❌ User not created");
      }

      logger.d("👤 User Service - ✅ User created");

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
}
