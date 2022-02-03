import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String name = "";

  @observable
  String image = "";

  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @action
  void initialize() {
    getUser();
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void getUser() {
    name = "Angel ";
  }

  @action
  Widget getImage() {
    if (image == "") {
      return Icon(Icons.person, color: Colors.white, size: 20);
    } else {
      return Image.network(
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif');
    }
  }

  @action
  void setEmail(String value) {
    email = value;
  }
}
