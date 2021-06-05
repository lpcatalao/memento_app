// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingStore on _OnboardingStoreBase, Store {
  final _$typeAtom = Atom(name: '_OnboardingStoreBase.type');

  @override
  AlertType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(AlertType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$pageAtom = Atom(name: '_OnboardingStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$isActivatedAtom = Atom(name: '_OnboardingStoreBase.isActivated');

  @override
  ObservableFuture<bool> get isActivated {
    _$isActivatedAtom.reportRead();
    return super.isActivated;
  }

  @override
  set isActivated(ObservableFuture<bool> value) {
    _$isActivatedAtom.reportWrite(value, super.isActivated, () {
      super.isActivated = value;
    });
  }

  final _$registerAlertAtom = Atom(name: '_OnboardingStoreBase.registerAlert');

  @override
  bool get registerAlert {
    _$registerAlertAtom.reportRead();
    return super.registerAlert;
  }

  @override
  set registerAlert(bool value) {
    _$registerAlertAtom.reportWrite(value, super.registerAlert, () {
      super.registerAlert = value;
    });
  }

  final _$mapAlertAtom = Atom(name: '_OnboardingStoreBase.mapAlert');

  @override
  ObservableFuture<bool> get mapAlert {
    _$mapAlertAtom.reportRead();
    return super.mapAlert;
  }

  @override
  set mapAlert(ObservableFuture<bool> value) {
    _$mapAlertAtom.reportWrite(value, super.mapAlert, () {
      super.mapAlert = value;
    });
  }

  final _$homeAlertAtom = Atom(name: '_OnboardingStoreBase.homeAlert');

  @override
  ObservableFuture<bool> get homeAlert {
    _$homeAlertAtom.reportRead();
    return super.homeAlert;
  }

  @override
  set homeAlert(ObservableFuture<bool> value) {
    _$homeAlertAtom.reportWrite(value, super.homeAlert, () {
      super.homeAlert = value;
    });
  }

  final _$_OnboardingStoreBaseActionController =
      ActionController(name: '_OnboardingStoreBase');

  @override
  void setPage(int page) {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlertType(AlertType type) {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.setAlertType');
    try {
      return super.setAlertType(type);
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchSharedPreferences() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.fetchSharedPreferences');
    try {
      return super.fetchSharedPreferences();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchRegisterSharedPreferences() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.fetchRegisterSharedPreferences');
    try {
      return super.fetchRegisterSharedPreferences();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchMapSharedPreferences() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.fetchMapSharedPreferences');
    try {
      return super.fetchMapSharedPreferences();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchHomeSharedPreferences() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.fetchHomeSharedPreferences');
    try {
      return super.fetchHomeSharedPreferences();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
page: ${page},
isActivated: ${isActivated},
registerAlert: ${registerAlert},
mapAlert: ${mapAlert},
homeAlert: ${homeAlert}
    ''';
  }
}
