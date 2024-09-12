import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = _MapStoreBase with _$MapStore;

abstract class _MapStoreBase with Store {
  @observable
  ObservableSet<Marker> markers = ObservableSet.of([]);

  @observable
  ObservableSet<Circle> circles = ObservableSet.of([]);

  @observable
  LatLng latLng = LatLng(0.0, 0.0);

  final initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  @observable
  GoogleMapController _controller;

  @observable
  StreamSubscription<Position> positionStream;

  @observable
  String address = '';

  @observable
  double counter = 0.0;

  double lvalue = 0.0;
  double uvalue = 10000.0;

  @action
  void addCounter(double value) {
    counter = value;
  }

  // @action
  // watchPosition() {
  //   positionStream = Geolocator.getPositionStream().listen((position) {
  //     if (position != null) {
  //       latitude = position.latitude;
  //       longitude = position.longitude;
  //     }
  //   });
  // }

  @action
  onMapCreated(GoogleMapController controller) {
    _controller = controller;
    changeMapMode();
  }

  @action
  void updateMarker() {
    Marker marker = Marker(markerId: MarkerId("0"), position: latLng);
    Set<Marker> markers = HashSet.of([marker]);
    this.markers = markers.asObservable();
  }

  @action
  void onTapMarker(LatLng latLng) {
    this.latLng = latLng;
    updateMarker();
    updateCircle();
  }

  @action
  void updateCircle() {
    Circle circle = Circle(
        circleId: CircleId("0"),
        radius: counter,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        center: latLng,
        fillColor: Colors.blue.withAlpha(70));
    Set<Circle> circles = HashSet.of([circle]);
    this.circles = circles.asObservable();
  }

  @action
  void setAddress(String address) {
    this.address = address;
  }

  void seachAndUpdate() async {
    List<Location> locations = await locationFromAddress(this.address);

    if (locations == null) {
      // message = 'Não foi possívek encontrar o endereço';

    }

    // message = '';
    Location location = locations[0];

    latLng = LatLng(location.latitude, location.longitude);
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 10.0)));
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;
    bool isActivated = await Geolocator.isLocationServiceEnabled();

    if (!isActivated) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Você precisa autorizar o acesso à localização.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Autorize o acesso à localização nas configuraçōes.");
    }

    return Geolocator.getCurrentPosition();
  }

  @action
  getPosition() async {
    try {
      final position = await _currentPosition();
      latLng = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getMapStyleJson(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  void changeMapMode() async {
    String mapStyle = await getMapStyleJson('assets/map/map_style.json');
    setMapStyle(mapStyle);
  }
}
