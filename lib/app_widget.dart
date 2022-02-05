import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';

class AppWidget extends StatelessWidget {
  final botToastBuilder = BotToastInit();

  AppWidget({key}) : super(key: key);

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
            primarySwatch: MaterialColor(
              0xFF678647,
              const <int, Color>{
                50: const Color(0xFF678647), //10%
                100: const Color(0xFF678647), //20%
                200: const Color(0xFF678647), //30%
                300: const Color(0xFF678647), //40%
                400: const Color(0xFF678647), //50%
                500: const Color(0xFF678647), //60%
                600: const Color(0xFF678647), //70%
                700: const Color(0xFF678647), //80%
                800: const Color(0xFF678647), //90%
                900: const Color(0xFF678647), //100%
              },
            ),
            //primarySwatch: ColorsApp.primary,
            canvasColor: Colors.transparent),
        initialRoute: '/login',
      ).modular(),
    );
  }
}
