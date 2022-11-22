import 'package:flutter/material.dart';

class SharedGradient {
  static List<Color> gradientColors(BuildContext context) {
    return [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
    ];
  }
}
