import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext{

  double get fontHeadline => (shortestSide * 0.055).clamp(20.0, 40.0);
  double get fontTitle    => (shortestSide * 0.042).clamp(16.0, 32.0);
  double get fontBody     => (shortestSide * 0.035).clamp(14.0, 30.0);
  double get fontLabel    => (shortestSide * 0.030).clamp(12.0, 25.0);

  double get spacingS  => shortestSide * 0.015;
  double get spacingM  => shortestSide * 0.045;
  double get spacingL  => shortestSide * 0.080;

  double get horizontalPadding => shortestSide * 0.065;
  double get logoWidth => (shortestSide * 0.30).clamp(150.0, 340.0);
  double get mainSpacing => (shortestSide * 0.06).clamp(20.0, 100.0);
}