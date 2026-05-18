import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(PageRouteName.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Positioned(top: 2, child: _GlowCirce()),

            Center(child: Image.asset('assets/images/route_logo.png')),
            Positioned(bottom: 0, child: _GlowCirce()),
          ],
        ),
      ),
    );
  }
}

class _GlowCirce extends StatelessWidget {
  const _GlowCirce({super.key});

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.sizeOf(context).shortestSide;
    return Container(
      width: 1,
      height: 1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(95),
            blurRadius: shortestSide * 0.3,
            blurStyle: BlurStyle.normal,
            spreadRadius: shortestSide * 0.28,
          ),
        ],
      ),
    );
  }
}
