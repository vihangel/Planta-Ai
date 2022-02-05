import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:plantaai/data/models/plants/page_plants_model.dart';
import 'package:plantaai/data/models/plants/plants_model.dart';
import 'package:plantaai/services/plants/plants_service.dart';
import 'package:plantaai/shared/constants.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  @observable
  String loader = "loading";

  @observable
  List<PlantsModel> plants = [];

  @observable
  List images = [];

  @observable
  List<PlantsModel> plantsOk = [];

  @observable
  bool isSubmited = false;

  final _plantsService = PlantsServices(Dio());

  @action
  void initialize() {
    getPlants();
  }

  @action
  Future<void> getPlants() async {
    loader = "loading";
    try {
      List<PagesPlantsModel> response = [];
      response.add(await _plantsService.getPlants(
          Constants.API_KEY_PEXEL, "plants", 10));
      debugPrint(response.toString());
      plants.clear();
      for (var element in response[0].photos!) {
        plants.add(element);
      }

      if (response[0].photos!.isEmpty) {
        loader = "empty";
      }

      print(loader);
    } catch (err) {
      print(err);
      loader = "empty";
    }
  }

  @action
  Future<void> updatePlants(String color) async {
    loader = "loading";
    try {
      List<PagesPlantsModel> response = [];
      response.add(
          await _plantsService.getPlants(Constants.API_KEY_PEXEL, color, 10));
      debugPrint(response.toString());
      plants.clear();
      for (var element in response[0].photos!) {
        plants.add(element);
      }

      if (response[0].photos!.isEmpty) {
        loader = "empty";
      }
      loader = "ready";
      print(loader);
    } catch (err) {
      print(err);
      loader = "empty";
    }
  }

  @action
  Future<void> loadPlants(context) async {
    loader = "loading";
    if (plants.isEmpty) {
      await getPlants();
    }

    for (var i = 0; i < plants.length; i++) {
      //images.add();
      // images.add(NetworkImage(
      //   plants[i].src!.original,
      // )));
      //await precacheImage(images[i], context);
      print("passou aqui");
    }

    loader = "ready";
  }
}
