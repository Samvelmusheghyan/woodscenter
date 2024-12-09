import 'package:flutter/material.dart';

extension ColorExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get onPrimary => colorScheme.onPrimary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  Color get secondary => colorScheme.secondary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get surface => colorScheme.surface;

  Color get surfaceContainer => colorScheme.surfaceContainer;

  Color get onSurface => colorScheme.onSurface;

  Color get tertiary => colorScheme.tertiary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get tertiaryFixed => colorScheme.tertiaryFixed;
}
