import 'package:memento_app/model/user_store.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  var user = UserStore();

  @observable
  String text;

  @action
  setText(String text) => this.text = text;
}
