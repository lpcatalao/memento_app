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

  _ProfileStoreBase(this.user, this.repository, this.caretaker) {
    fetchUser();
    fetchCaretakers();
  }

  @observable
  ObservableFuture<List<User>> users = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Caretaker>> caretakers = ObservableFuture.value([]);

  @observable
  ObservableFuture<int> userID = ObservableFuture.value(-1);

  @observable
  ObservableFuture<int> caretakerID = ObservableFuture.value(-1);

  @action
  fetchUser() => users = repository.findUser().asObservable();

  void searchUser() {
    repository.findUser().then((value) {
      print(value);
    });
  }

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
