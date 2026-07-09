import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext{

  double get fontHeadline => (shortestSide * 0.055).clamp(20.0, 38.0);
  double get fontTitle    => (shortestSide * 0.042).clamp(16.0, 28.0);
  double get fontBody     => (shortestSide * 0.035).clamp(14.0, 22.0);
  double get fontLabel    => (shortestSide * 0.030).clamp(12.0, 18.0);

  double get spacingS  => shortestSide * 0.025;
  double get spacingM  => shortestSide * 0.045;
  double get spacingL  => shortestSide * 0.080;

  double get horizontalPadding => shortestSide * 0.065;
  double get logoWidth => (shortestSide * 0.30).clamp(100.0, 240.0);
  double get mainSpacing => (shortestSide * 0.06).clamp(16.0, 80.0);
}