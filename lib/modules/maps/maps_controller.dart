import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:planta_ai/data/models/plants/plants_model.dart';
import 'package:planta_ai/modules/product/product_controller.dart';

part 'maps_controller.g.dart';

class MapsController = _MapsControllerBase with _$MapsController;

abstract class _MapsControllerBase with Store {
  @action
  void initialize() {}

  @observable
  LatLng initialcameraposition = LatLng(14.2350, 51.9253);

  late GoogleMapController controllerMap;

  @observable
  ProductController controller = Modular.get<ProductController>();

  @observable
  List<PlantsModel> plants = [];

  @observable
  Location location = Location();

  @action
  void onMapCreated(GoogleMapController _cntlr) {
    controllerMap = _cntlr;
    location.onLocationChanged.listen((l) {
      controllerMap.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @action
  void getData() {
    plants.addAll(controller.plants);
  }
}
