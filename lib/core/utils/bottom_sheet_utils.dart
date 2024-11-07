import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/theme/theme.dart';

class BottomSheetConfig {
  BottomSheetConfig({
    required this.body,
    this.useRootNavigator = true,
    this.paddingHorizontal = 0,
    this.borderRadius = 16,
    this.widthDivider,
    this.maxHeight,
    this.bottomSheetColor,
    this.paddingTopToContent,
  });

  final Widget body;
  final bool useRootNavigator;
  final double paddingHorizontal;
  final double borderRadius;
  final double? widthDivider;
  final double? maxHeight;
  final Color? bottomSheetColor;
  final double? paddingTopToContent;
}

abstract class BottomSheetUtils {
  static void showBottomSheet({
    required BottomSheetConfig config,
    required BuildContext context,
  }) {
    showModalBottomSheet(
      barrierColor: const Color(0xFF000000).withOpacity(0.5),
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: config.maxHeight ??
            (AppSizes.currentScreenHeight - AppSizes.screenPaddingTop - AppSizes.screenPaddingBottom - 50),
        minWidth: AppSizes.currentScreenWidth,
      ),
      isScrollControlled: true,
      useRootNavigator: config.useRootNavigator,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => _buildBottomSheet(context, config),
    );
  }

  static Widget _buildBottomSheet(BuildContext context, BottomSheetConfig config) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildContainer(context, config),
        _buildDivider(context, config),
      ],
    );
  }

  static Widget _buildContainer(BuildContext context, BottomSheetConfig config) {
    return Container(
      constraints: BoxConstraints(minWidth: AppSizes.currentScreenWidth),
      padding: EdgeInsets.only(top: config.paddingTopToContent ?? 28.h),
      decoration: BoxDecoration(
        color: config.bottomSheetColor ?? AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(config.borderRadius.r),
          topRight: Radius.circular(config.borderRadius.r),
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: config.paddingHorizontal.w,
        ),
        child: Column(
          children: [
            config.body,
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  static Widget _buildDivider(BuildContext context, BottomSheetConfig config) {
    return Positioned(
      top: 8.h,
      child: Container(
        width: config.widthDivider ?? 45.w,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: const Color(0xFFEDEDED).withOpacity(0.08),
        ),
      ),
    );
  }
}
