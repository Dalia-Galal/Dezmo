import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key,
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double size = MediaQuery.sizeOf(context).shortestSide;
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        foregroundColor: ColorPalette.mainColor,
        backgroundColor: ColorPalette.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        maximumSize: Size.fromWidth(size / 0.55),
        minimumSize: MediaQuery.sizeOf(context) / 15,
      ),
      child: Text(text, style: theme.textTheme.titleLarge),
    );
  }
}
