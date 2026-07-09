import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double size = MediaQuery.sizeOf(context).shortestSide;
    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        foregroundColor: ColorPalette.mainColor,
        backgroundColor: ColorPalette.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        maximumSize: Size.fromWidth(size / 0.55),
        minimumSize: MediaQuery.sizeOf(context) / 15,
      ),
      child: Text(
        'Login',
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
