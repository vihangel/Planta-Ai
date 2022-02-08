// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsController on _MapsControllerBase, Store {
  final _$isReadonlyAtom = Atom(name: '_MapsControllerBase.isReadonly');

  @override
  bool get isReadonly {
    _$isReadonlyAtom.reportRead();
    return super.isReadonly;
  }

  @override
  set isReadonly(bool value) {
    _$isReadonlyAtom.reportWrite(value, super.isReadonly, () {
      super.isReadonly = value;
    });
  }

  final _$pickedPositionAtom = Atom(name: '_MapsControllerBase.pickedPosition');

  @override
  LatLng? get pickedPosition {
    _$pickedPositionAtom.reportRead();
    return super.pickedPosition;
  }

  @override
  set pickedPosition(LatLng? value) {
    _$pickedPositionAtom.reportWrite(value, super.pickedPosition, () {
      super.pickedPosition = value;
    });
  }

  final _$initialcamerapositionAtom =
      Atom(name: '_MapsControllerBase.initialcameraposition');

  @override
  LatLng? get initialcameraposition {
    _$initialcamerapositionAtom.reportRead();
    return super.initialcameraposition;
  }

  @override
  set initialcameraposition(LatLng? value) {
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

  final _$adressAtom = Atom(name: '_MapsControllerBase.adress');

  @override
  String get adress {
    _$adressAtom.reportRead();
    return super.adress;
  }

  @override
  set adress(String value) {
    _$adressAtom.reportWrite(value, super.adress, () {
      super.adress = value;
    });
  }

  final _$selectPositionAsyncAction =
      AsyncAction('_MapsControllerBase.selectPosition');

  @override
  Future<void> selectPosition(LatLng position) {
    return _$selectPositionAsyncAction
        .run(() => super.selectPosition(position));
  }

  final _$getCurrentUserLocationAsyncAction =
      AsyncAction('_MapsControllerBase.getCurrentUserLocation');

  @override
  Future<void> getCurrentUserLocation() {
    return _$getCurrentUserLocationAsyncAction
        .run(() => super.getCurrentUserLocation());
  }

  final _$getAddressAsyncAction = AsyncAction('_MapsControllerBase.getAddress');

  @override
  Future<String> getAddress(double? lat, double? lang) {
    return _$getAddressAsyncAction.run(() => super.getAddress(lat, lang));
  }

  final _$_MapsControllerBaseActionController =
      ActionController(name: '_MapsControllerBase');

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
isReadonly: ${isReadonly},
pickedPosition: ${pickedPosition},
initialcameraposition: ${initialcameraposition},
controller: ${controller},
plants: ${plants},
adress: ${adress}
    ''';
  }
}
