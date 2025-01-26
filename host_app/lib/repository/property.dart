import 'dart:io' as io;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PropertyRepository {
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
              CREATE TABLE property(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  user_id INTEGER NOT NULL,
                  address_id INTEGER NOT NULL,
                  title VARCHAR NOT NULL,
                  description VARCHAR NOT NULL,
                  number INTEGER NOT NULL,
                  complement VARCHAR,
                  price REAL NOT NULL,
                  max_guest INTEGER NOT NULL,
                  thumbnail VARCHAR NOT NULL,
                  FOREIGN KEY(user_id) REFERENCES user(id),
                  FOREIGN KEY(address_id) REFERENCES address(id)
              );
              """;
              await db.execute(sql);
            }));

    // Inserting some properties for testing
    await db.execute(
        "INSERT INTO property(user_id, address_id, title, description, number, complement, price, max_guest, thumbnail) VALUES(1, 1, 'Apartamento Quarto Privativo', 'Apartamento perto do Centro com 2 quartos, cozinha e lavanderia.', 100, 'Apto 305', 120.0, 2, 'image_path');");
    await db.execute(
        "INSERT INTO property(user_id, address_id, title, description, number, complement, price, max_guest, thumbnail) VALUES(1, 1, 'Hotel Ibis', 'Quarto Básico com cama casal.', 200, NULL, 220.0, 2, 'image_path');");
    await db.execute(
        "INSERT INTO property(user_id, address_id, title, description, number, complement, price, max_guest, thumbnail) VALUES(1, 2, 'Pousada X', 'Quarto Básico com cama casal e cama de solteiro.', 300, NULL, 320.0, 3, 'image_path');");
    await db.execute(
        "INSERT INTO property(user_id, address_id, title, description, number, complement, price, max_guest, thumbnail) VALUES(1, 2, 'Chalé perto de praia', 'Quarto com cama casal.', 400, NULL, 420.0, 2, 'image_path');");

    return db;
  }

  Future<List<Map<String, dynamic>>> getAllProperties(String id) async {
    final db = await database;
    return db.query("property", where: "user_id = ?", whereArgs: [id]);
  }
}
