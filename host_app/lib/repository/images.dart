import 'dart:io' as io;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ImagesRepository {
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
              CREATE TABLE images(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  property_id INTEGER NOT NULL,
                  path VARCHAR NOT NULL,    
                  FOREIGN KEY(property_id) REFERENCES property(id)
              );

              INSERT INTO images(property_id, path) VALUES(1, 'image_path_1' );
              INSERT INTO images(property_id, path) VALUES(1, 'image_path_2' );
              INSERT INTO images(property_id, path) VALUES(1, 'image_path_3' );
              INSERT INTO images(property_id, path) VALUES(2, 'image_path_1' );
              INSERT INTO images(property_id, path) VALUES(2, 'image_path_2' );
              INSERT INTO images(property_id, path) VALUES(2, 'image_path_3' );
              """;
              await db.execute(sql);
            }));
    return db;
  }
}
