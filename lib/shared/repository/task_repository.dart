import 'package:memento_app/database/dao/task_dao.dart';
import 'package:memento_app/shared/model/task.dart';

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
}
