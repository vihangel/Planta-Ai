import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:planta_ai/models/user/user_model.dart';

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

  // static Future<FirebaseApp> initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();

  //   // TODO: Add auto login logic

  //   return firebaseApp;
  // }

  //https://pub.dev/packages/sms_user_consent redefinir senha futura implementação

  @action
  Future<void> faceBookAuth() async {
    try {
      await FacebookAuth.i.logOut();
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: [
          'public_profile',
          'email',
          'pages_show_list',
          'pages_messaging',
          'pages_manage_metadata'
        ],
      ); // by default we request the email and the public profile
// or FacebookAuth.i.login()
      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;
      } else {
        print(result.status);
        print(result.message);
      }
      // print("login");
      // LoginResult token =
      //     await FacebookAuth.instance.login(permissions: ["email"]);
      // print("token");
      // print(token.accessToken.toString());
      // // get the user data
      // final userData = await FacebookAuth.instance.getUserData();
      //print(auserData);

    } catch (err) {
      print(err);
    }
    // await FacebookAuth.i.logOut();
    // final result =
    //     await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    // print(result.status);
    // if (result.status == LoginStatus.success) {
    //   final response = await FacebookAuth.i.getUserData(fields: "name, email");
    //   final user = UserModel(
    //     name: response.toString(),
    //     photoURL: "response.photoUrl",
    //   );
    //   //teste = userData;
    //   print("user.name");
    //   print("\n\n\n\n\n\n\n\n\n");
    //   print("\n\n\n\n\n\n\n\n\n");
    //   print(response);
    //   print(user.name);
    //   print("\n\n\n\n\n\n\n\n\n");
    // }
  }

  var teste;
  @action
  Future<void> googleAuth() async {
    //final authController = AuthController();
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );

      print("\n\n\n\n\n\n\n\n\n");
      print(user.name);
    } catch (error) {
      print(error);
    }
  }

  @action
  void saveUser() {}
}
