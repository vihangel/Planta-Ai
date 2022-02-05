import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:planta_ai/data/models/user/user_model.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ), //)
  );
}

Future<void> initHive() async {
  final pathDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(pathDir.path);

  Hive.registerAdapter<UserModel>(UserModelAdapter());
}
