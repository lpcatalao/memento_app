// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$itemSelectedAtom = Atom(name: 'HomeStoreBase.itemSelected');

  @override
  int get itemSelected {
    _$itemSelectedAtom.reportRead();
    return super.itemSelected;
  }

  @override
  set itemSelected(int value) {
    _$itemSelectedAtom.reportWrite(value, super.itemSelected, () {
      super.itemSelected = value;
    });
  }

  final _$tasksAtom = Atom(name: 'HomeStoreBase.tasks');

  @override
  ObservableFuture<List<Task>> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableFuture<List<Task>> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$modelAtom = Atom(name: 'HomeStoreBase.model');

  @override
  ListScreenModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ListScreenModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setItemSelected(int index) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setItemSelected');
    try {
      return super.setItemSelected(index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchTodayData(DateTime date) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.fetchTodayData');
    try {
      return super.fetchTodayData(date);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(Task task) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setModel');
    try {
      return super.setModel(task);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemSelected: ${itemSelected},
tasks: ${tasks},
model: ${model}
    ''';
  }
}
