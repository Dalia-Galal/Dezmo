import 'package:device_preview/device_preview.dart';
import 'package:e_commerceapp/core/app_theme/theme_manager.dart';
import 'package:e_commerceapp/core/routes_manager/app_router.dart';
import 'package:e_commerceapp/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Dezmo',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData,
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig:AppRouter.router
    );
  }
}
