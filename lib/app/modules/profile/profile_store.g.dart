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

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  dynamic fetchUser() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.findUser');
    try {
      return super.fetchUser();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users}
    ''';
  }
}
