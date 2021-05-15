import 'package:memento_app/shared/model/user_model.dart';
import 'package:memento_app/shared/model/user_store.dart';
import 'package:memento_app/shared/repository/profile_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final UserStore user;

  final ProfileRepository repository;

  @observable
  ObservableFuture<List<User>> users;

  @observable
  ObservableFuture<int> userID;

  _ProfileStoreBase(this.user, this.repository) {
    fetchUser();
  }

  @action
  fetchUser() => users = repository.findAll().asObservable();

  @action
  insertUser(User user) => userID = repository.insert(user).asObservable();
}
