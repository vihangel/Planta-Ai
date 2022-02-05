import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantaai/modules/login/login_controller.dart';

import 'package:plantaai/shared/resources/colors.dart';
import 'package:plantaai/shared/resources/images.dart';
import 'package:plantaai/shared/resources/text_style.dart';

final controller = Modular.get<LoginController>();

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              controller.isSubmited = false;
              Modular.to.pop();
            },
            icon: const Icon(Icons.arrow_back, color: ColorsApp.white)),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsApp.gray,
      extendBodyBehindAppBar: true,
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
                  color: ColorsApp.primary,
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
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Relaxa...\né rapidinho redefinir a senha!",
                      style: TextStyles.titleRegular,
                      textAlign: TextAlign.center,
                    ),
                    const Padding(padding: const EdgeInsets.all(5)),
                    const Text(
                      "Mandaremos um email com um link para que você possa digitar uma nova senha",
                      textAlign: TextAlign.center,
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
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
                    const Padding(padding: const EdgeInsets.all(20)),
                    TextButton(
                      onPressed: () {
                        controller.passwordRecovery();
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorsApp.primary,
                        ),
                        child: Text(
                          "Enviar",
                          style: TextStyles.buttonBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
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
