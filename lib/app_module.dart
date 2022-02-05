import 'package:flutter_modular/flutter_modular.dart';
import 'package:planta_ai/modules/home/home_page.dart';
import 'package:planta_ai/modules/maps/maps_controller.dart';

import 'modules/home/home_controller.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';

import 'modules/product/product_controller.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => ProductController()),
    Bind.lazySingleton((i) => MapsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
  ];
}
