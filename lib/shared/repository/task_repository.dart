import 'package:memento_app/database/dao/task_dao.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/shared/model/task_status.dart';

class TaskRepository {
  final TaskDao _taskDao;

  TaskRepository(this._taskDao);

  Future<int> insertTask(Task task) {
    return _taskDao.insert(task);
  }

  Future<List<Task>> findAll() {
    return _taskDao.findAll();
  }

  Future<List<Task>> findAllActivity() {
    return _taskDao.findAllActivity();
  }

  Future<List<Task>> findAllMedicine() {
    return _taskDao.findAllMedicine();
  }

  Future<List<Task>> findAllBrainFitness() {
    return _taskDao.findAllBrainFitness();
  }

  Future<List<Task>> findAllFromDate(String date) {
    return _taskDao.findAllFromDate(date);
  }

  Future<Map<String, TaskStatus>> findTaskStatus() async {
    List<Map> allTaskStatus = await _taskDao.groudByAllTaskStatus();
    List<Map> completedTaskStatus = await _taskDao.groupByCompletedTaskStatus();

    TaskStatus statusActivity = TaskStatus(0, 0);
    TaskStatus statusMedicine = TaskStatus(0, 0);
    TaskStatus statusBrainFitness = TaskStatus(0, 0);

    for (Map map in allTaskStatus) {
      var type = map['taskType'];
      var total = map['COUNT(*)'];

      switch (type) {
        case "Atividade":
          statusActivity.total = total;
          break;
        case "Medicamento":
          statusMedicine.total = total;
          break;
        case "BrainFitness":
          statusBrainFitness.total = total;
          break;
      }
    }

    for (Map map in completedTaskStatus) {
      var type = map['taskType'];
      var completed = map['COUNT(*)'];

      switch (type) {
        case "Atividade":
          statusActivity.completed = completed;
          break;
        case "Medicamento":
          statusMedicine.completed = completed;
          break;
        case "BrainFitness":
          statusBrainFitness.completed = completed;
          break;
      }
    }

    var map = Map<String, TaskStatus>();
    map["activity"] = statusActivity;
    map["medicine"] = statusMedicine;
    map["bf"] = statusBrainFitness;

    return map;
  }

  Future<List<Task>> findAllActivityDone() {
    return _taskDao.findAllActivityDone();
  }

  Future<List<Task>> findAllMedicineDone() {
    return _taskDao.findAllMedicineDone();
  }

  Future<List<Task>> findAllBrainFitnessDone() {
    return _taskDao.findAllBrainFitnessDone();
  }
}
