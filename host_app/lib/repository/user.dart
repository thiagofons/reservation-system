import 'dart:io' as io;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  late Database _database;

  Future<Database> get database async {
    _database = await _initDatabase();

    return _database;
  }

  Future<Database> _initDatabase() async {
    final io.Directory appDocumentsDir =
        await getApplicationDocumentsDirectory();
    final path =
        p.join(appDocumentsDir.path, "databases", "reservations_app.db");

    Database db = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: 1,
            onCreate: (db, version) async {
              String sql = """
              CREATE TABLE user(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name VARCHAR NOT NULL,
                  email VARCHAR NOT NULL,
                  password VARCHAR NOT NULL
              );

              """;
              await db.execute(sql);
            }));

    // Inserting some users for testing
    await db.execute(
        "INSERT INTO user(name, email, password) VALUES('Teste 1', 'teste1@teste', '123456');");
    await db.execute(
        "INSERT INTO user(name, email, password) VALUES('Teste 2', 'teste2@teste', '123456');");
    await db.execute(
        "INSERT INTO user(name, email, password) VALUES('Teste 3', 'teste3@teste', '123456');");
    await db.execute(
        "INSERT INTO user(name, email, password) VALUES('Teste 4', 'teste4@teste', '123456');");
    await db.execute(
        "INSERT INTO user(name, email, password) VALUES('Teste 5', 'teste5@teste', '123456');");

    return db;
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query('user');
    return users;
  }

  Future<Map<String, dynamic>?> getUserByEmailAndPassword(
      String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query('user',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (users.isNotEmpty) {
      return users.first;
    }

    return null;
  }
}
