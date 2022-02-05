// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductControllerBase, Store {
  final _$loaderAtom = Atom(name: '_ProductControllerBase.loader');

  @override
  String get loader {
    _$loaderAtom.reportRead();
    return super.loader;
  }

  @override
  set loader(String value) {
    _$loaderAtom.reportWrite(value, super.loader, () {
      super.loader = value;
    });
  }

  final _$plantsAtom = Atom(name: '_ProductControllerBase.plants');

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

  final _$imagesAtom = Atom(name: '_ProductControllerBase.images');

  @override
  List<dynamic> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<dynamic> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$plantsOkAtom = Atom(name: '_ProductControllerBase.plantsOk');

  @override
  List<PlantsModel> get plantsOk {
    _$plantsOkAtom.reportRead();
    return super.plantsOk;
  }

  @override
  set plantsOk(List<PlantsModel> value) {
    _$plantsOkAtom.reportWrite(value, super.plantsOk, () {
      super.plantsOk = value;
    });
  }

  final _$isSubmitedAtom = Atom(name: '_ProductControllerBase.isSubmited');

  @override
  bool get isSubmited {
    _$isSubmitedAtom.reportRead();
    return super.isSubmited;
  }

  @override
  set isSubmited(bool value) {
    _$isSubmitedAtom.reportWrite(value, super.isSubmited, () {
      super.isSubmited = value;
    });
  }

  final _$getPlantsAsyncAction =
      AsyncAction('_ProductControllerBase.getPlants');

  @override
  Future<void> getPlants() {
    return _$getPlantsAsyncAction.run(() => super.getPlants());
  }

  final _$updatePlantsAsyncAction =
      AsyncAction('_ProductControllerBase.updatePlants');

  @override
  Future<void> updatePlants(String color) {
    return _$updatePlantsAsyncAction.run(() => super.updatePlants(color));
  }

  final _$loadPlantsAsyncAction =
      AsyncAction('_ProductControllerBase.loadPlants');

  @override
  Future<void> loadPlants(dynamic context) {
    return _$loadPlantsAsyncAction.run(() => super.loadPlants(context));
  }

  final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase');

  @override
  void initialize() {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.initialize');
    try {
      return super.initialize();
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loader: ${loader},
plants: ${plants},
images: ${images},
plantsOk: ${plantsOk},
isSubmited: ${isSubmited}
    ''';
  }
}
