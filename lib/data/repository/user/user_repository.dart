import 'package:hive/hive.dart';

import 'package:plantaai/data/models/user/user_model.dart';
import 'package:plantaai/shared/constants.dart';

class UserRepository extends UserModelAdapter {
  static Future<List<UserModel>> saveUser(List<UserModel> value) async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    await dbUser.clear();

    for (int i = 0; i < value.length; i++) {
      await dbUser.add(value[i]);
    }
    //await dbUser.addAll(value);
    print("User salvo" + value[0].email!);

    return value;
  }

  static Future<List<UserModel>> getUser() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    List<UserModel> userList = [];
    print(dbUser.length);
    for (int i = 0; i < dbUser.length; i++) {
      userList.add(dbUser.getAt(i)!);
    }

    print("Pegando infos de usuario " + userList.isEmpty.toString());
    return userList;
  }

  static Future<void> deleteAll() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    await dbUser.clear();
    print("Usuario deletado");
    return;
  }

  static Future<bool> isUserStored() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    print("User esta logado?" + dbUser.isNotEmpty.toString());
    return dbUser.isNotEmpty;
  }
}
