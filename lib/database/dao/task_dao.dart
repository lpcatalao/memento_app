import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  AppDatabase _db;

  TaskDao(this._db);

  Future<int> insert(Task task) async {
    Database db = await _db.createDatabase();

    Future<int> insert = db.insert('task', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    findAll().then((value) {
      print(value);
    });

    return insert;
  }

  Future<List<Task>> findAll() async {
    Database db = await _db.createDatabase();
    List<Map<String, dynamic>> result = await db.query('task');
    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }
    return tasks;
  }

  Future<List<Task>> findAllActivity() async {
    Database db = await _db.createDatabase();

    List<Map> result = await db
        .rawQuery("SELECT * FROM task WHERE ${TASK_TYPE} = 'Atividade'");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> findAllMedicine() async {
    Database db = await _db.createDatabase();

    List<Map> result = await db
        .rawQuery("SELECT * FROM task WHERE ${TASK_TYPE} = 'Medicamento'");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> findAllBrainFitness() async {
    Database db = await _db.createDatabase();

    List<Map> result = await db
        .rawQuery("SELECT * FROM task WHERE ${TASK_TYPE} = 'BrainFitness'");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> findAllFromDate(String date) async {
    Database db = await _db.createDatabase();

    List<Map> result =
        await db.rawQuery("SELECT * FROM task WHERE ${TASK_DATE} = '${date}'");

    final List<Task> tasks = [];
    for (Map<String, dynamic> map in result) {
      final Task task = Task(map[TASK_TEXT], map[TASK_DATEMILLIS],
          map[TASK_HOUR], map[TASK_MIN], map[TASK_DATE], map[TASK_TYPE]);

      task.id = map[TASK_ID];
      tasks.add(task);
    }

    return tasks;
  }
}
