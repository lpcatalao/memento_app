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
  String birthDate = "";

  @action
  setBirthDate(String birthDate) => this.birthDate = birthDate;
}
