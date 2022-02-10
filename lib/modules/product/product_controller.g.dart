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

  final _$imgPlantsAtom = Atom(name: '_ProductControllerBase.imgPlants');

  @override
  List<Widget> get imgPlants {
    _$imgPlantsAtom.reportRead();
    return super.imgPlants;
  }

  @override
  set imgPlants(List<Widget> value) {
    _$imgPlantsAtom.reportWrite(value, super.imgPlants, () {
      super.imgPlants = value;
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

  final _$colorAtom = Atom(name: '_ProductControllerBase.color');

  @override
  String get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(String value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
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

  final _$incrementAtom = Atom(name: '_ProductControllerBase.increment');

  @override
  int get increment {
    _$incrementAtom.reportRead();
    return super.increment;
  }

  @override
  set increment(int value) {
    _$incrementAtom.reportWrite(value, super.increment, () {
      super.increment = value;
    });
  }

  final _$isLoadingVerticalAtom =
      Atom(name: '_ProductControllerBase.isLoadingVertical');

  @override
  bool get isLoadingVertical {
    _$isLoadingVerticalAtom.reportRead();
    return super.isLoadingVertical;
  }

  @override
  set isLoadingVertical(bool value) {
    _$isLoadingVerticalAtom.reportWrite(value, super.isLoadingVertical, () {
      super.isLoadingVertical = value;
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
  Future<void> updatePlants(String selectedColor) {
    return _$updatePlantsAsyncAction
        .run(() => super.updatePlants(selectedColor));
  }

  final _$loadMorePlantsAsyncAction =
      AsyncAction('_ProductControllerBase.loadMorePlants');

  @override
  Future<void> loadMorePlants() {
    return _$loadMorePlantsAsyncAction.run(() => super.loadMorePlants());
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
  void addImgList(int index) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.addImgList');
    try {
      return super.addImgList(index);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlants(List<PlantsModel> responsePlants) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.addPlants');
    try {
      return super.addPlants(responsePlants);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loader: ${loader},
plants: ${plants},
imgPlants: ${imgPlants},
plantsOk: ${plantsOk},
color: ${color},
isSubmited: ${isSubmited},
increment: ${increment},
isLoadingVertical: ${isLoadingVertical}
    ''';
  }
}
