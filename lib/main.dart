import 'package:device_preview/device_preview.dart';
import 'package:e_commerceapp/core/app_theme/theme_manager.dart';
import 'package:e_commerceapp/core/di/service_locator.dart';
import 'package:e_commerceapp/core/routes_manager/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
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
      routerConfig: AppRouter.router,
    );
  }
}
