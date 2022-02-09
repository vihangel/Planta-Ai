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
  @observable
  bool isReadonly = false;

  @observable
  LatLng? pickedPosition;

  @observable
  LatLng? initialcameraposition = LatLng(0, 0);

  @observable
  ProductController controller = Modular.get<ProductController>();

  @observable
  List<PlantsModel> plants = [];

  @action
  Future<void> selectPosition(LatLng position) async {
    pickedPosition = position;
    adress = await getAddress(position.latitude, position.longitude);
  }

  @action
  Future<LatLng?> onTapMap() async {
    Future.delayed(const Duration(seconds: 2), () {
      return isReadonly ? null : selectPosition;
    });
    return pickedPosition;
  }

  @action
  Future<void> getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      initialcameraposition = LatLng(
        locData.latitude as double,
        locData.longitude as double,
      );
      selectPosition(initialcameraposition!);
    } catch (e) {
      print("erro " + e.toString());
      return;
    }
  }

  @action
  Future<String> getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) {
      return "";
    } else {
      try {
        GeoCode geoCode = GeoCode();
        Address address =
            await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
        adress =
            "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
        return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
      } catch (e) {
        Future.delayed(const Duration(seconds: 2), () {});
        GeoCode geoCode = GeoCode();
        Address address =
            await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
        print(e);
        adress =
            "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
        return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
      }
    }
  }

  @observable
  String adress = "";

  @action
  void getData() {
    plants.addAll(controller.plants);
  }
}
