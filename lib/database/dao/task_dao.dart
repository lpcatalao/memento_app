import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  AppDatabase _db;

  TaskDao(this._db);

  Future<int> insert(Task task) async {
    Database db = await _db.createDatabase();

    Future<int> insert = db.insert(TASK_TABLE, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return insert;
  }

  Future<List<Task>> findAll() async {
    Database db = await _db.createDatabase();
    List<Map<String, dynamic>> result = await db.query(TASK_TABLE);
    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }
    return tasks;
  }

  Future<List<Task>> _findTask(String type, int status) async {
    Database db = await _db.createDatabase();

    List<Map> result = await db.rawQuery(
        "SELECT * FROM ${TASK_TABLE} WHERE ${TASK_TYPE} = '${type}' AND ${TASK_STATUS} = ${status}");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> findAllActivity() async => _findTask("Atividade", 0);

  Future<List<Task>> findAllActivityDone() async => _findTask("Atividade", 1);

  Future<List<Task>> findAllMedicine() async => _findTask("Medicamento", 0);

  Future<List<Task>> findAllMedicineDone() async => _findTask("Medicamento", 1);

  Future<List<Task>> findAllBrainFitness() async =>
      _findTask("BrainFitness", 0);

  Future<List<Task>> findAllBrainFitnessDone() async =>
      _findTask("BrainFitness", 1);

  Future<List<Task>> findAllFromDate(String date) async {
    Database db = await _db.createDatabase();

    List<Map> result = await db
        .rawQuery("SELECT * FROM ${TASK_TABLE} WHERE ${TASK_DATE} = '${date}'");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Map>> groudByAllTaskStatus() async {
    Database db = await _db.createDatabase();

    return db.rawQuery(
        "SELECT ${TASK_TYPE}, COUNT(*) FROM ${TASK_TABLE} GROUP BY ${TASK_TYPE}");
  }

  Future<List<Map>> groupByCompletedTaskStatus() async {
    Database db = await _db.createDatabase();

    return db.rawQuery(
        "SELECT ${TASK_TYPE}, COUNT(*) FROM ${TASK_TABLE} WHERE ${TASK_STATUS} = 1 GROUP BY ${TASK_TYPE}");
  }

  void updateTaskStatus(int taskId, int value) async {
    Database db = await _db.createDatabase();
    db.rawUpdate(
        "UPDATE ${TASK_TABLE} SET ${TASK_STATUS} = ? WHERE ${TASK_ID} = ?",
        [value, taskId]);
  }
}
