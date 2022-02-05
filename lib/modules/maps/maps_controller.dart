import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:plantaai/data/models/plants/plants_model.dart';

import 'package:plantaai/modules/product/product_controller.dart';

part 'maps_controller.g.dart';

class MapsController = _MapsControllerBase with _$MapsController;

abstract class _MapsControllerBase with Store {
  @action
  void initialize() {}

  @observable
  LatLng initialcameraposition = LatLng(14.2350, 51.9253);

  GoogleMapController? controllerMap;

  @observable
  ProductController controller = Modular.get<ProductController>();

  @observable
  List<PlantsModel> plants = [];

  @observable
  Location location = Location();

  @action
  void onMapCreated(GoogleMapController _cntlr) {
    location.onLocationChanged.listen(
      (l) {
        getAddress(l.latitude!, l.longitude!);
        controllerMap!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
          ),
        );
      },
    );
  }

  @action
  Future<String> getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) return "";
    GeoCode geoCode = GeoCode();
    Address address =
        await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
    print(
        "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}");
    adress =
        "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
    return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
  }

  @observable
  String adress = "";

  @action
  void getData() {
    plants.addAll(controller.plants);
  }
}
