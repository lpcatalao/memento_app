import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _DB_VERSION = 1;
  static const _DB_NAME = 'memento.db';

  Future<Database> createDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _DB_NAME);
    return openDatabase(path, onCreate: (db, version) {
      return db.execute("CREATE TABLE user ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "address TEXT,"
          "city TEXT,"
          "phone INTEGER,"
          "birth_date TEXT)");
    }, version: _DB_VERSION);
  }
}
