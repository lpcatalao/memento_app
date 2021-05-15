import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDao{

  AppDatabase db;

  UserDao(this.db);

  Future<int> insert(User user) async {
    Database db = await this.db.createDatabase();
    return db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> findAll() async {
    Database db = await this.db.createDatabase();
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