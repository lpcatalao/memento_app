import 'package:memento_app/database/dao/caretaker_dao.dart';
import 'package:memento_app/database/dao/user_dao.dart';
import 'package:memento_app/shared/model/caretaker_model.dart';
import 'package:memento_app/shared/model/user_model.dart';

class ProfileRepository {
  final UserDao _userDao;
  final CaretakerDao _caretakerDao;

  ProfileRepository(this._userDao, this._caretakerDao);

  Future<List<User>> findUser() {
    return _userDao.findAll();
  }

  Future<int> insertUser(User user) {
    return _userDao.insert(user);
  }

  Future<List<Caretaker>> findAllCaretaker() {
    return _caretakerDao.findAll();
  }

  Future<int> insertCaretaker(Caretaker caretaker) {
    return _caretakerDao.insert(caretaker);
  }
}
