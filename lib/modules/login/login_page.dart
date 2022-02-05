import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:plantaai/shared/resources/colors.dart';
import 'package:plantaai/shared/resources/images.dart';
import 'package:plantaai/shared/resources/text_style.dart';

import 'login_controller.dart';

final controller = Modular.get<LoginController>();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsApp.gray,
      body: Observer(builder: (context) {
        controller.isSubmited;
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.15,
                ),
                decoration: const BoxDecoration(
                  //color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: AssetImage(ImagesApp.splashbg),
                    fit: BoxFit.cover,
                    //opacity: 1,
                  ),

                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60.0),
                    bottomLeft: Radius.circular(60.0),
                  ),
                ),
                width: size.width,
                height: size.height * 0.30,
                //color: ColorsApp.primary,
                child: SvgPicture.asset(
                  ImagesApp.logo,
                  //height: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // Text(
                    //   "Vamos comprar novas plantinhas?",
                    //   style: TextStyles.titleRegular,
                    //   textAlign: TextAlign.center,
                    // ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Faça login para comprar novas plantinhas",
                      style: TextStyles.titleRegular,
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Email",
                        errorText: controller.validateEmail(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: ColorsApp.white,
                      ),
                      onChanged: (value) {
                        controller.setEmail(value);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      onChanged: (value) {
                        controller.setPassword(value);
                      },
                      obscureText: !controller.isVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorsApp.primary,
                          ),
                          onPressed: () {
                            controller.setIsVisible();
                          },
                        ),
                        hintText: "Senha",
                        errorText: controller.validatePassword(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: ColorsApp.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Esqueceu a senha?",
                        style: TextStyles.regular,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextButton(
                      onPressed: () {
                        controller.verify();
                      },
                      child: Container(
                        width: size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorsApp.primary,
                        ),
                        child: Text(
                          "Entrar",
                          style: TextStyles.buttonBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "ou",
                      style: TextStyles.regular,
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.faceBookAuth();
                            print("aqui");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue[300],
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: ColorsApp.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.googleAuth();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red[300],
                            ),
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: ColorsApp.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
