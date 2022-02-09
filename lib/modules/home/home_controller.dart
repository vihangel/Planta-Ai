import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:plantaai/data/models/user/user_model.dart';
import 'package:plantaai/data/repository/user/user_repository.dart';

import 'package:plantaai/shared/resources/colors.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<UserModel> user = ObservableList();

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
  Future<void> getUser() async {
    if (user.isEmpty) {
      user.clear();
      user.addAll(await UserRepository.getUser());
      getImagePerfil();
    }
  }

  @action
  Widget getImage() {
    if (image == "") {
      return const Icon(Icons.person, color: Colors.white, size: 20);
    } else {
      return Image.network(
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif');
    }
  }

  @observable
  Widget imgPerfil = Container();

  @action
  void getImagePerfil() {
    if (user[0].photoURL! == null) {
      imgPerfil = Container(
        width: 80,
        color: ColorsApp.primary,
        child: const Icon(
          Icons.person_outline_sharp,
          color: ColorsApp.white,
        ),
      );
    } else {
      imgPerfil = CachedNetworkImage(
        placeholder: (context, url) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        imageUrl: user[0].photoURL.toString(),
      );
    }
  }

  @action
  Future<void> logout() async {
    Modular.to.navigate("/splash");
    Future.delayed(const Duration(seconds: 2), () {
      user.clear();
    });
    GoogleSignIn _googleSignIn = GoogleSignIn();
    _googleSignIn.signOut();
    FacebookAuth.i.logOut();
    UserRepository.deleteAll();
  }
}
