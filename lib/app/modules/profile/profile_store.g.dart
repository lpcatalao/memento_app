// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  final _$usersAtom = Atom(name: '_ProfileStoreBase.users');

  @override
  ObservableFuture<List<User>> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<List<User>> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$caretakersAtom = Atom(name: '_ProfileStoreBase.caretakers');

  @override
  ObservableFuture<List<Caretaker>> get caretakers {
    _$caretakersAtom.reportRead();
    return super.caretakers;
  }

  @override
  set caretakers(ObservableFuture<List<Caretaker>> value) {
    _$caretakersAtom.reportWrite(value, super.caretakers, () {
      super.caretakers = value;
    });
  }

  final _$userIDAtom = Atom(name: '_ProfileStoreBase.userID');

  @override
  ObservableFuture<int> get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(ObservableFuture<int> value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  final _$caretakerIDAtom = Atom(name: '_ProfileStoreBase.caretakerID');

  @override
  ObservableFuture<int> get caretakerID {
    _$caretakerIDAtom.reportRead();
    return super.caretakerID;
  }

  @override
  set caretakerID(ObservableFuture<int> value) {
    _$caretakerIDAtom.reportWrite(value, super.caretakerID, () {
      super.caretakerID = value;
    });
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  dynamic fetchUser() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.fetchUser');
    try {
      return super.fetchUser();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchCaretakers() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.fetchCaretakers');
    try {
      return super.fetchCaretakers();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic insertUser(User user) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.insertUser');
    try {
      return super.insertUser(user);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic insertCaretaker(Caretaker caretaker) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.insertCaretaker');
    try {
      return super.insertCaretaker(caretaker);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
caretakers: ${caretakers},
userID: ${userID},
caretakerID: ${caretakerID}
    ''';
  }
}
