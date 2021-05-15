import 'package:memento_app/database/dao/user_dao.dart';
import 'package:memento_app/shared/model/user_model.dart';

class ProfileRepository {
  final UserDao dao;

  ProfileRepository(this.dao);

  Future<List<User>> findAll() {
    return dao.findAll();
  }

  Future<int> insert(User user) {
    return dao.insert(user);
  }
}
