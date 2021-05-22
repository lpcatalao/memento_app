import 'package:memento_app/constants/db_constants.dart';
import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/shared/model/caretaker_model.dart';
import 'package:sqflite/sqflite.dart';

class CaretakerDao {
  AppDatabase db;

  CaretakerDao(this.db);

  Future<int> insert(Caretaker caretaker) async {
    Database db = await this.db.createDatabase();

    Future<int> insert = db.insert(
        DBConstant.CARETAKER_TABLE, caretaker.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    findAll().then((value) {
      print(value);
    });
    return insert;
  }

  Future<List<Caretaker>> findAll() async {
    Database db = await this.db.createDatabase();
    List<Map<String, dynamic>> result =
        await db.query(DBConstant.CARETAKER_TABLE);
    final List<Caretaker> caretakers = [];
    for (Map<String, dynamic> map in result) {
      final Caretaker caretaker = Caretaker(
        map[CARETAKER_NAME],
        map[CARETAKER_ADDRESS],
        map[CARETAKER_CITY],
        map[CARETAKER_PHONE],
      );

      caretaker.id = map[CARETAKER_ID];

      caretakers.add(caretaker);
    }
    return caretakers;
  }
}
