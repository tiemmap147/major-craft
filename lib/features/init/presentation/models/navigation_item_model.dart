import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem({
    required this.label,
    required this.iconPath,
    required this.colorFilter,
    required this.activeColorFilter,
  });

  final String label;
  final String iconPath;
  final ColorFilter colorFilter;
  final ColorFilter activeColorFilter;
}
