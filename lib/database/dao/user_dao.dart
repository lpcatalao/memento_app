import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/shared/model/caretaker_model.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  AppDatabase db;

  UserDao(this.db);

  Future<int> insert(User user) async {
    Database db = await this.db.createDatabase();

    Future<int> insert = db.insert(USER_TABLE, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return insert;
  }

  Future<List<User>> findAll() async {
    Database db = await this.db.createDatabase();
    List<Map<String, dynamic>> result = await db.query(USER_TABLE);
    final List<User> users = [];
    for (Map<String, dynamic> map in result) {
      final User user = User(map[USER_NAME], map[USER_ADDRESS], map[USER_CITY],
          map[USER_PHONE], map[USER_BIRTH_DATE]);

      user.caretakerId = map[FK_CARETAKER_ID];
      user.id = map[USER_ID];

      users.add(user);
    }
    return users;
  }

  Future<String> findUserCaretaker() async {
    Database db = await this.db.createDatabase();
    List<Map> result = await db.rawQuery(""
        "SELECT c.caretakerName FROM ${USER_TABLE} AS u INNER JOIN ${CARETAKER_TABLE} AS c ON  c.caretakerId = u.caretakerId");

    String caretakerName;
    for (Map m in result) {
      caretakerName = m['caretakerName'];
    }

    return caretakerName;
  }

  void updateUserCaretaker(int userCaretakerId) async {
    Database db = await this.db.createDatabase();
    db.rawUpdate(
        "UPDATE ${USER_TABLE} SET ${FK_CARETAKER_ID} = ? WHERE ${USER_ID} = 1",
        [userCaretakerId]);
  }
}
