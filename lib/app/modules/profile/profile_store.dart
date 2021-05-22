import 'package:memento_app/shared/model/caretaker_model.dart';
import 'package:memento_app/shared/model/caretaker_store.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:memento_app/shared/model/user_store.dart';
import 'package:memento_app/shared/repository/profile_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final UserStore user;
  final CaretakerStore caretaker;

  final ProfileRepository repository;

  @observable
  ObservableFuture<List<User>> users;

  @observable
  ObservableFuture<List<Caretaker>> caretakers;

  @observable
  ObservableFuture<int> userID;

  @observable
  ObservableFuture<int> caretakerID;

  _ProfileStoreBase(this.user, this.repository, this.caretaker) {
    fetchUser();
    fetchCaretakers();
  }

  @action
  fetchUser() => users = repository.findUser().asObservable();

  @action
  fetchCaretakers() =>
      caretakers = repository.findAllCaretaker().asObservable();

  @action
  insertUser(User user) => userID = repository.insertUser(user).asObservable();

  @action
  insertCaretaker(Caretaker caretaker) =>
      caretakerID = repository.insertCaretaker(caretaker).asObservable();

  updateUserCaretaker(int userCaretakerId) {
    repository.updateUserCaretaker(userCaretakerId);
  }
}
