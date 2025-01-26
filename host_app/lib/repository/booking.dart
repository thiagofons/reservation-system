import 'dart:io' as io;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BookingRepository {
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
              CREATE TABLE booking(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                property_id INTEGER NOT NULL,
                checkin_date VARCHAR NOT NULL,
                checkout_date VARCHAR NOT NULL,
                total_days INTEGER NOT NULL,
                total_price REAL NOT NULL,
                amount_guest INTEGER NOT NULL,
                rating REAL,
                FOREIGN KEY(user_id) REFERENCES user(id),
                FOREIGN KEY(property_id) REFERENCES property(id)
              );

              INSERT INTO booking(user_id, property_id, checkin_date, checkout_date, total_days, total_price, amount_guest, rating) VALUES(4, 1, '2025-02-01', '2025-02-03', 2, 240.0, 2, NULL);
              INSERT INTO booking(user_id, property_id, checkin_date, checkout_date, total_days, total_price, amount_guest, rating) VALUES(4, 2, '2025-04-01', '2025-04-03', 2, 480.0, 1, NULL);
              INSERT INTO booking(user_id, property_id, checkin_date, checkout_date, total_days, total_price, amount_guest, rating) VALUES(3, 3, '2025-05-09', '2025-05-15', 6, 1920.0, 2, NULL);
              INSERT INTO booking(user_id, property_id, checkin_date, checkout_date, total_days, total_price, amount_guest, rating) VALUES(5, 3, '2025-09-09', '2025-09-15', 6, 1920.0, 2, NULL);
              INSERT INTO booking(user_id, property_id, checkin_date, checkout_date, total_days, total_price, amount_guest, rating) VALUES(1, 4, '2025-09-09', '2025-09-15', 6, 2520.0, 2, NULL);
              """;
              await db.execute(sql);
            }));
    return db;
  }
}
