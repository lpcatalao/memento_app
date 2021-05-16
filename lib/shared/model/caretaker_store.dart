import 'package:mobx/mobx.dart';

part 'caretaker_store.g.dart';

class CaretakerStore = _CaretakerStore with _$CaretakerStore;

abstract class _CaretakerStore with Store {
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
}
