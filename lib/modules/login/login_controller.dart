import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool isSubmited = false;

  @action
  String? validateEmail() {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == "" && isSubmited) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(email) && isSubmited) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  @action
  String? validatePassword() =>
      password == "" && isSubmited ? "A senha não pode ser vazia" : null;

  @observable
  bool isVisible = true;

  @action
  void setIsVisible() {
    isVisible = !isVisible;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  Future<void> verify() async {
    isSubmited = true;

    if (validatePassword() == null && validateEmail() == null) {
      print("pode seguir a pagina");
      Modular.to.navigate("/home");
    } else {
      throw ("err");
    }
  }
}
