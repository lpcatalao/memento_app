import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int itemSelected = 0;

  @action
  void setItemSelected(int index) {
    itemSelected = index;
  }

  bool isVisible() {
    if (itemSelected > 0) {
      return true;
    }
    return false;
  }
}
