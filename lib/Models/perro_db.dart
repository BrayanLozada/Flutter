import 'package:path/path.dart';
import 'package:perro_bloc_formz/Models/perro.dart';
import 'package:sqflite/sqflite.dart';

class PerroDatabase {
   static final PerroDatabase _instance = PerroDatabase._internal();

   factory PerroDatabase() => _instance;

   static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  PerroDatabase._internal();

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'perro_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE dog (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      },
    );
  }

  Future<int> agregarPerro(String nombre) async {
    final db = await database;
    return  await db.insert( 'dog', {'name': nombre});
      // conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<List<Perro>> obtenerPerros() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dog');
    return List.generate(maps.length, (i) {
      return Perro(
        nombre: maps[i]['name'],
      );
    });
  }

  // Future<void> updateDog(Dog dog) async {
  //   final db = await database;
  //   await db.update(
  //     'dog',
  //     dog.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [dog.id],
  //   );
  // }

  // Future<void> deleteDog(int id) async {
  //   final db = await database;
  //   await db.delete(
  //     'dog',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
