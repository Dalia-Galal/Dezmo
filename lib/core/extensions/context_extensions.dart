import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get shortestSide => MediaQuery.of(this).size.shortestSide;
  bool get isTablet => shortestSide >= 650;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}