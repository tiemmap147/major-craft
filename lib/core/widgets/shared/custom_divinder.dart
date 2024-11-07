import 'package:flutter/material.dart';
import 'package:major_craft_application/theme/theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.thickness = 1,
    this.color = AppColors.neutral300,
  });
  final double thickness;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: thickness,
      width: AppSizes.currentScreenWidth,
      color: color,
    );
  }
}
