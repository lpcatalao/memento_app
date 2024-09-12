import 'package:memento_app/shared/model/caretaker_model.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> createDatabase() async {
    final path = join(await getDatabasesPath(), 'memento.db');
    return openDatabase(path, onCreate: (db, version) async {
      await db.execute('CREATE TABLE ${USER_TABLE}('
          '${USER_ID} INTEGER PRIMARY KEY,'
          '${USER_NAME} TEXT,'
          '${USER_ADDRESS} TEXT,'
          '${USER_CITY} TEXT,'
          '${USER_PHONE} INTEGER,'
          '${USER_BIRTH_DATE} TEXT,'
          '${FK_CARETAKER_ID} INTEGER,'
          'FOREIGN KEY(${FK_CARETAKER_ID}) REFERENCES caretaker(${CARETAKER_ID}))');

      await db.execute("CREATE TABLE ${CARETAKER_TABLE}("
          "${CARETAKER_ID} INTEGER PRIMARY KEY,"
          "${CARETAKER_NAME} TEXT,"
          "${CARETAKER_ADDRESS} TEXT,"
          "${CARETAKER_CITY} TEXT,"
          "${CARETAKER_PHONE} INTEGER)");

      await db.execute("CREATE TABLE ${TASK_TABLE}("
          "${TASK_ID} INTEGER PRIMARY KEY,"
          "${TASK_TEXT} TEXT,"
          "${TASK_DATEMILLIS} INTEGER,"
          "${TASK_HOUR} INTEGER,"
          "${TASK_MIN} INTEGER,"
          "${TASK_STATUS} INTEGER,"
          "${TASK_DATE} TEXT,"
          "${TASK_TYPE} TEXT)");
    }, version: 1, onConfigure: _onConfigure);
  }

  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }
}
