import 'package:flutter_modular/flutter_modular.dart';
import 'package:planta_ai/modules/home/home_page.dart';

import 'modules/home/home_controller.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';
import 'modules/product/product_controller.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => ProductController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
  ];
}
