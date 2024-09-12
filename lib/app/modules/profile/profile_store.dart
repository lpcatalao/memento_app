import 'package:intl/intl.dart';
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

  @observable
  String userCaretaker = '';

  @observable
  int age = 0;

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

  @action
  setAge(String date) {
    final birthDate = DateFormat('dd/MM/yyyyy').parse(date);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }

    this.age = age;
  }

  @action
  fetchUserCaretaker() {
    repository.findUserCaretaker().then((value) {
      userCaretaker = value;
    });
  }
}
