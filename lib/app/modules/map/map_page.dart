import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memento_app/app/modules/map/map_appbar_widget.dart';
import 'package:memento_app/app/modules/map/map_store.dart';

class MapPage extends StatefulWidget {

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends ModularState<MapPage, MapStore> {
  @override
  void initState() {
    store.getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Observer(
              builder: (BuildContext context) {
                return GoogleMap(
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: true,
                    onMapCreated: store.onMapCreated,
                    markers: store.markers,
                    circles: store.circles,
                    onTap: store.onTapMarker,
                    initialCameraPosition: store.initialCameraPosition);
              },
            ),
            Positioned(
              top: _size.height * .22,
              right: 15,
              left: 15,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Observer(
                  builder: (BuildContext context) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Adicione seu endereço',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 15.0, left: 15.0),
                        suffixIcon: IconButton(
                          iconSize: 35.0,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            store.seachAndUpdate();

                            // if (store.message.length > 0) {
                            //   SnackBar(
                            //     content: Text(store.message),
                            //     action: SnackBarAction(
                            //       onPressed: () {},
                            //       label: 'Sair',
                            //     ),
                            //   );
                            // }
                          },
                        ),
                      ),
                      onChanged: store.setAddress,
                    );
                  },
                ),
              ),
            ),
            MapAppbarWidget(_size.width, _size.height),
            Positioned(
                top: _size.height * .30,
                right: 15,
                left: 15,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Observer(
                    builder: (BuildContext context) {
                      return Slider(
                        label: store.counter.toString(),
                        min: store.lvalue,
                        max: store.uvalue,
                        onChanged: (value) {
                          store.addCounter(value);
                        },
                        value: store.counter,
                      );
                    },
                  ),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.done),
          onPressed: () {
            store.updateCircle();
          },
        ));
  }
}
