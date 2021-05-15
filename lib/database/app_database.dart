import 'package:memento_app/model/user_model.dart';
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

  Future<int> insert(User user) async {
    Database db = await createDatabase();
    return db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> findAll() async {
    Database db = await createDatabase();
    List<Map<String, dynamic>> result = await db.query('user');
    final List<User> users = [];
    for (Map<String, dynamic> map in result) {

      final User user = User(
          map['name'],
          map['address'],
          map['city'],
          map['phone'],
          map['birth_date']
      );

      user.id = map['id'];

      users.add(user);
    }
    return users;
  }
}
