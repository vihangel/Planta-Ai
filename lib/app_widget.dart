import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';

class AppWidget extends StatelessWidget {
  final botToastBuilder = BotToastInit();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.4, 683.4),
      builder: () => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: (context, child) {
          child = DevicePreview.appBuilder(context, child);
          child = botToastBuilder(context, child);
          return child;
        },
        debugShowCheckedModeBanner: false,
        title: 'PlantaAi',
        theme: ThemeData(
            fontFamily: 'Inter',
            primarySwatch: Colors.blue,
            canvasColor: Colors.transparent),
        initialRoute: '/login',
      ).modular(),
    );
  }
}
