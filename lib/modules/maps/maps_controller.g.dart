// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsController on _MapsControllerBase, Store {
  final _$initialcamerapositionAtom =
      Atom(name: '_MapsControllerBase.initialcameraposition');

  @override
  LatLng get initialcameraposition {
    _$initialcamerapositionAtom.reportRead();
    return super.initialcameraposition;
  }

  @override
  set initialcameraposition(LatLng value) {
    _$initialcamerapositionAtom.reportWrite(value, super.initialcameraposition,
        () {
      super.initialcameraposition = value;
    });
  }

  final _$controllerAtom = Atom(name: '_MapsControllerBase.controller');

  @override
  ProductController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(ProductController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$plantsAtom = Atom(name: '_MapsControllerBase.plants');

  @override
  List<PlantsModel> get plants {
    _$plantsAtom.reportRead();
    return super.plants;
  }

  @override
  set plants(List<PlantsModel> value) {
    _$plantsAtom.reportWrite(value, super.plants, () {
      super.plants = value;
    });
  }

  final _$locationAtom = Atom(name: '_MapsControllerBase.location');

  @override
  Location get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(Location value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  final _$_MapsControllerBaseActionController =
      ActionController(name: '_MapsControllerBase');

  @override
  void initialize() {
    final _$actionInfo = _$_MapsControllerBaseActionController.startAction(
        name: '_MapsControllerBase.initialize');
    try {
      return super.initialize();
    } finally {
      _$_MapsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onMapCreated(GoogleMapController _cntlr) {
    final _$actionInfo = _$_MapsControllerBaseActionController.startAction(
        name: '_MapsControllerBase.onMapCreated');
    try {
      return super.onMapCreated(_cntlr);
    } finally {
      _$_MapsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getData() {
    final _$actionInfo = _$_MapsControllerBaseActionController.startAction(
        name: '_MapsControllerBase.getData');
    try {
      return super.getData();
    } finally {
      _$_MapsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialcameraposition: ${initialcameraposition},
controller: ${controller},
plants: ${plants},
location: ${location}
    ''';
  }
}
