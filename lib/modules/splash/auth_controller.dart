import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:plantaai/data/repository/user/user_repository.dart';
import 'package:plantaai/modules/home/home_controller.dart';
import 'package:plantaai/shared/resources/images.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;
final controller = Modular.get<HomeController>();

abstract class _AuthControllerBase with Store {
  @action
  Future<void> currentUser() async {
    await Future.delayed(Duration(seconds: 2));

    if (await UserRepository.isUserStored()) {
      controller.initialize();
      Modular.to.navigate("/home");
    } else {
      Modular.to.navigate("/login");
      // Modular.to.pushNamed("/login");
    }
  }

  @action
  void preImage(context) {
    print("passou aqui");
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ImagesApp.logoG),
        context);
  }
}
