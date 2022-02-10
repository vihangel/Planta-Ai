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
  List<Widget> imgPlants = ObservableList();

  @observable
  List<PlantsModel> plantsOk = [];

  @observable
  String color = "plants";

  @observable
  bool isSubmited = false;

  final _plantsService = PlantsServices(Dio());

  @action
  void initialize() {
    getPlants();
  }

  @action
  void addImgList(int index) {
    imgPlants.add(
      CachedNetworkImage(
        placeholder: (context, url) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
          ],
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: plants[index].src!.original,
        fit: BoxFit.cover,
      ),
    );
  }

  @action
  Future<void> getPlants() async {
    List<PagesPlantsModel> response = [];
    List<PlantsModel> responsePlants = [];
    loader = "loading";

    try {
      //chama
      response.add(
          await _plantsService.getPlants(Constants.API_KEY_PEXEL, color, 8));
      debugPrint(response.toString());

      //add response
      for (var element in response[0].photos!) {
        responsePlants.add(element);
      }

      //response empty
      if (responsePlants.isEmpty) {
        loader = "empty";
      } else {
        if (plants.isNotEmpty) {
          if (plants[0].id != responsePlants[0].id) {
            //imgPlants.clear();
            plants.clear();
            plants.addAll(responsePlants);

            for (var i = 0; i < responsePlants.length; i++) {
              addImgList(i);
            }
          }
          addPlants(responsePlants);
        } else {
          imgPlants.clear();
          plants.clear();
          plants.addAll(responsePlants);

          for (var i = 0; i < plants.length; i++) {
            addImgList(i);
          }
        }

        loader = "ready";
      }
      print(loader);
    } catch (err) {
      print(err);
      print("Aqui2");
      loader = "empty";
    }
  }

  @action
  void addPlants(List<PlantsModel> responsePlants) {
    if (plants.length != responsePlants.length) {
      final int l = plants.length;
      for (var i = l; i < responsePlants.length; i++) {
        plants.add(responsePlants[i]);
        addImgList(i);
      }
    }
  }

  @action
  Future<void> updatePlants(String selectedColor) async {
    color = selectedColor;
    List<PagesPlantsModel> response = [];
    List<PlantsModel> responsePlants = [];
    loader = "loading";

    try {
      //chama
      response.add(
          await _plantsService.getPlants(Constants.API_KEY_PEXEL, color, 8));
      debugPrint(response.toString());

      //add response
      for (var element in response[0].photos!) {
        responsePlants.add(element);
      }

      //response empty
      if (responsePlants.isEmpty) {
        loader = "empty";
      } else {
        imgPlants.clear();
        plants.clear();
        plants.addAll(responsePlants);

        for (var i = 0; i < plants.length; i++) {
          addImgList(i);
        }

        loader = "ready";
      }
      print(loader);
    } catch (err) {
      print(err);
      print("Aqui2");
      loader = "empty";
    }
  }

  //loadlist

  @observable
  int increment = 4;

  @observable
  bool isLoadingVertical = false;

  @action
  Future<void> loadMorePlants() async {
    List<PagesPlantsModel> response = [];
    List<PlantsModel> responsePlants = [];

    try {
      //chama
      response.add(await _plantsService.getPlants(
          Constants.API_KEY_PEXEL, color, plants.length + increment));
      debugPrint(response.toString());

      //add response
      for (var element in response[0].photos!) {
        responsePlants.add(element);
      }

      //response empty
      if (responsePlants.isEmpty) {
        loader = "empty";
      } else {
        if (plants.isNotEmpty) {
          if (plants[0].id != responsePlants[0].id) {
            //imgPlants.clear();
            plants.clear();
            plants.addAll(responsePlants);

            for (var i = 0; i < responsePlants.length; i++) {
              addImgList(i);
            }
          }
          addPlants(responsePlants);
        } else {
          imgPlants.clear();
          plants.clear();
          plants.addAll(responsePlants);

          for (var i = 0; i < plants.length; i++) {
            addImgList(i);
          }
        }
      }
      print(loader);
    } catch (err) {
      print(err);
    }
  }
}
