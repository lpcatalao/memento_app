import 'package:memento_app/app/modules/home/page/model_components/alert/alert_model.dart';
import 'package:memento_app/shared/repository/onboard_repository.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  final OnboardinRepository _onboardinRepository;

  _OnboardingStoreBase(this._onboardinRepository);

  @observable
  AlertType type;

  @observable
  int page = 0;

  @observable
  ObservableFuture<bool> isActivated = ObservableFuture.value(false);

  @observable
  bool registerAlert = false;

  @observable
  ObservableFuture<bool> mapAlert = ObservableFuture.value(false);

  @observable
  ObservableFuture<bool> homeAlert = ObservableFuture.value(false);

  @action
  void setPage(int page) {
    this.page = page;
  }

  @action
  void setAlertType(AlertType type) {
    this.type = type;
  }

  void setSharedPrefsValue() {
    if (type == AlertType.REGISTER) {
      setRegisterSharedPreferences(true);
    } else if (type == AlertType.MAP) {
      setMapSharedPreferences(true);
    } else if (type == AlertType.HOME) {
      setHomeSharedPreferences(true);
    }
  }

  @action
  void fetchSharedPreferences() {
    isActivated = _onboardinRepository.getSharedPref().asObservable();
  }

  @action
  void fetchRegisterSharedPreferences() {
    _onboardinRepository.getRegisterSharedPreferences().then((value) {
      registerAlert = value;
    });
  }

  @action
  void fetchMapSharedPreferences() {
    mapAlert = _onboardinRepository.getMapSharedPreferences().asObservable();
  }

  @action
  void fetchHomeSharedPreferences() {
    homeAlert = _onboardinRepository.getHomeSharedPreferences().asObservable();
  }

  void setSharedPreferences(bool state) {
    _onboardinRepository.setSharedPref(state);
    fetchSharedPreferences();
  }

  void setRegisterSharedPreferences(bool state) {
    _onboardinRepository.setRegisterSharedPreferences(state);
    fetchRegisterSharedPreferences();
  }

  void setMapSharedPreferences(bool state) {
    _onboardinRepository.setMapSharedPreferences(state);
    fetchMapSharedPreferences();
  }

  void setHomeSharedPreferences(bool state) {
    _onboardinRepository.setHomeSharedPreferences(state);
    fetchHomeSharedPreferences();
  }
}
