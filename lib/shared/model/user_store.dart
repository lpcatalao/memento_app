import 'package:memento_app/utilities/datetime_formatter.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  String name = "";

  @action
  setName(String name) => this.name = name;

  @observable
  String address = "";

  @action
  setAddress(String address) => this.address = address;

  @observable
  String city = "";

  @action
  setCity(String city) => this.city = city;

  @observable
  int phone = 0000;

  @action
  setPhone(String phone) => this.phone = int.tryParse(phone);

  @observable
  String birthDate = formatDate(DateTime.now());

  @observable
  int age = 0;

  @action
  setBirthDate(DateTime birthDate) {
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

    this.birthDate = formatDate(birthDate);
  }
}
