import 'package:memento_app/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> createDatabase() async {
    final String path = join(await getDatabasesPath(), DBConstant.DB_NAME);
    return openDatabase(path,
        onCreate: (db, version) => _createDB(db), version: 1);
  }

  void _createDB(Database db) {
    db.execute("CREATE TABLE ${DBConstant.USER_TABLE} ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "address TEXT,"
        "city TEXT,"
        "phone INTEGER,"
        "birth_date TEXT)");

    db.execute("CREATE TABLE ${DBConstant.CARETAKER_TABLE} ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "address TEXT,"
        "city TEXT,"
        "phone INTEGER)");
  }
}
