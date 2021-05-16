// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caretaker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CaretakerStore on _CaretakerStore, Store {
  final _$nameAtom = Atom(name: '_CaretakerStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$addressAtom = Atom(name: '_CaretakerStore.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$cityAtom = Atom(name: '_CaretakerStore.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$phoneAtom = Atom(name: '_CaretakerStore.phone');

  @override
  int get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(int value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$_CaretakerStoreActionController =
      ActionController(name: '_CaretakerStore');

  @override
  dynamic setName(String name) {
    final _$actionInfo = _$_CaretakerStoreActionController.startAction(
        name: '_CaretakerStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_CaretakerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAddress(String address) {
    final _$actionInfo = _$_CaretakerStoreActionController.startAction(
        name: '_CaretakerStore.setAddress');
    try {
      return super.setAddress(address);
    } finally {
      _$_CaretakerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCity(String city) {
    final _$actionInfo = _$_CaretakerStoreActionController.startAction(
        name: '_CaretakerStore.setCity');
    try {
      return super.setCity(city);
    } finally {
      _$_CaretakerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String phone) {
    final _$actionInfo = _$_CaretakerStoreActionController.startAction(
        name: '_CaretakerStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_CaretakerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
address: ${address},
city: ${city},
phone: ${phone}
    ''';
  }
}
