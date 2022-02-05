import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantaai/modules/splash/auth_controller.dart';
import 'package:plantaai/shared/resources/colors.dart';
import 'package:plantaai/shared/resources/images.dart';

final controller = Modular.get<AuthController>();

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.currentUser();
    controller.preImage(context);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsApp.primary,
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Observer(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: SvgPicture.asset(
                    ImagesApp.logoG,
                  ),
                ),
              );
              ;
            },
          ),
        ),
      ),
    );
  }
}
