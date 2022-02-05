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
        // builder: (context, child) {
        //   child = DevicePreview.appBuilder(context, child);
        //   child = botToastBuilder(context, child);
        //   return child;
        // },
        debugShowCheckedModeBanner: false,
        title: 'PlantaAi',
        theme: ThemeData(
            fontFamily: 'Inter',
            primarySwatch: const MaterialColor(
              0xFF678647,
              <int, Color>{
                50: Color(0xFF678647), //10%
                100: Color(0xFF678647), //20%
                200: Color(0xFF678647), //30%
                300: Color(0xFF678647), //40%
                400: Color(0xFF678647), //50%
                500: Color(0xFF678647), //60%
                600: Color(0xFF678647), //70%
                700: Color(0xFF678647), //80%
                800: Color(0xFF678647), //90%
                900: Color(0xFF678647), //100%
              },
            ),
            //primarySwatch: ColorsApp.primary,
            canvasColor: Colors.transparent),
        initialRoute: '/splash',
      ).modular(),
    );
  }
}
