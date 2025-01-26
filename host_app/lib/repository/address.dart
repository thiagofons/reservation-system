import 'dart:io' as io;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AddressRepository {
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
              CREATE TABLE address(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  cep VARCHAR NOT NULL UNIQUE,
                  logradouro VARCHAR NOT NULL,
                  bairro VARCHAR NOT NULL,
                  localidade VARCHAR NOT NULL,
                  uf VARCHAR NOT NULL,
                  estado VARCHAR NOT NULL
              );

              INSERT INTO address(cep, logradouro, bairro, localidade, uf, estado) VALUES('01001000', 'Praça da Sé', 'Sé', 'São Paulo', 'SP', 'São Paulo');
              INSERT INTO address(cep, logradouro, bairro, localidade, uf, estado) VALUES('24210346', 'Avenida General Milton Tavares de Souza', 'Gragoatá', 'Niterói', 'RJ', 'Rio de Janeiro');
              """;
              await db.execute(sql);
            }));
    return db;
  }
}
