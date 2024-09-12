// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on _MapStoreBase, Store {
  final _$markersAtom = Atom(name: '_MapStoreBase.markers');

  @override
  ObservableSet<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableSet<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$circlesAtom = Atom(name: '_MapStoreBase.circles');

  @override
  ObservableSet<Circle> get circles {
    _$circlesAtom.reportRead();
    return super.circles;
  }

  @override
  set circles(ObservableSet<Circle> value) {
    _$circlesAtom.reportWrite(value, super.circles, () {
      super.circles = value;
    });
  }

  final _$latLngAtom = Atom(name: '_MapStoreBase.latLng');

  @override
  LatLng get latLng {
    _$latLngAtom.reportRead();
    return super.latLng;
  }

  @override
  set latLng(LatLng value) {
    _$latLngAtom.reportWrite(value, super.latLng, () {
      super.latLng = value;
    });
  }

  final _$_controllerAtom = Atom(name: '_MapStoreBase._controller');

  @override
  GoogleMapController get _controller {
    _$_controllerAtom.reportRead();
    return super._controller;
  }

  @override
  set _controller(GoogleMapController value) {
    _$_controllerAtom.reportWrite(value, super._controller, () {
      super._controller = value;
    });
  }

  final _$positionStreamAtom = Atom(name: '_MapStoreBase.positionStream');

  @override
  StreamSubscription<Position> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(StreamSubscription<Position> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  final _$addressAtom = Atom(name: '_MapStoreBase.address');

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

  final _$counterAtom = Atom(name: '_MapStoreBase.counter');

  @override
  double get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(double value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$getPositionAsyncAction = AsyncAction('_MapStoreBase.getPosition');

  @override
  Future getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  final _$_MapStoreBaseActionController =
      ActionController(name: '_MapStoreBase');

  @override
  void addCounter(double value) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.addCounter');
    try {
      return super.addCounter(value);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMapCreated(GoogleMapController controller) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.onMapCreated');
    try {
      return super.onMapCreated(controller);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMarker() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.updateMarker');
    try {
      return super.updateMarker();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapMarker(LatLng latLng) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.onTapMarker');
    try {
      return super.onTapMarker(latLng);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCircle() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.updateCircle');
    try {
      return super.updateCircle();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String address) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.setAddress');
    try {
      return super.setAddress(address);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
circles: ${circles},
latLng: ${latLng},
positionStream: ${positionStream},
address: ${address},
counter: ${counter}
    ''';
  }
}
