import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// return screen size
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// return screen size
  Size get size => MediaQuery.of(this).size;

  /// return screen width
  double get width => MediaQuery.of(this).size.width;

  /// return screen height
  double get height => MediaQuery.of(this).size.height;

  /// return screen devicePixelRatio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.of(this).platformBrightness;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns primaryColor Color
  Color get primaryColor => theme.primaryColor;

  Color get primaryColorDark => theme.primaryColorDark;

  Color get primaryColorLight => theme.primaryColorLight;

  /// Returns primaryColor Color
  Color get cardColor => theme.cardColor;

  /// Returns background Color
  Color get backgroundColor => theme.backgroundColor;
}
