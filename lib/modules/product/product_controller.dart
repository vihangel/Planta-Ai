import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:planta_ai/models/plants/page_plants_model.dart';
import 'package:planta_ai/models/plants/plants_model.dart';
import 'package:planta_ai/services/plants/plants_service.dart';
import 'package:planta_ai/shared/constants.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  @observable
  String loader = "loading";

  @observable
  List<PlantsModel> plants = [];

  @observable
  bool isSubmited = false;

  final _plantsService = PlantsServices(Dio());

  @action
  void initialize() {
    getPlants();
  }

  @action
  Future<void> getPlants() async {
    try {
      List<PagesPlantsModel> response = [];
      response.add(await _plantsService.getPlants(
          Constants.API_KEY_PEXEL, "Plants", 10));
      debugPrint(response.toString());
      plants.clear();
      response[0].photos!.forEach((PlantsModel element) => plants.add(element));
    } catch (err) {
      print(err);
    }
  }
}
