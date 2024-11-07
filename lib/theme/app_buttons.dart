import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_sizes.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

abstract class AppButtons {
  static Widget primaryButton({
    bool isDisable = false,
    double buttonWDesignWidth = 351,
    String titleButton = 'Save change',
    VoidCallback? onTap,
  }) {
    final double buttonWidth = AppSizes.currentScreenWidth * (buttonWDesignWidth / AppSizes.designScreenWidth);
    final double buttonHeight = buttonWidth * (40 / 351);

    return ElevatedButton(
      onPressed: isDisable ? null : onTap ?? () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth, buttonHeight),
        elevation: 0,
        backgroundColor: AppColors.primary300,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        disabledBackgroundColor: AppColors.primary200,
        enableFeedback: true,
      ),
      child: Text(
        titleButton,
        style: AppTextStyle.secondaryText14Medium().copyWith(color: Colors.white),
      ),
    );
  }

  static Widget primaryOutLineButton({
    bool isDisable = false,
    double buttonWDesignWidth = 351,
    String titleButton = 'Clear',
    VoidCallback? onTap,
  }) {
    final double buttonWidth = AppSizes.currentScreenWidth * (buttonWDesignWidth / AppSizes.designScreenWidth);
    final double buttonHeight = buttonWidth * (40 / 351);

    return ElevatedButton(
      onPressed: isDisable ? null : onTap ?? () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth, buttonHeight),
        elevation: 0,
        // backgroundColor: AppColors.primary300,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
          side: const BorderSide(color: AppColors.black),
        ),
        disabledBackgroundColor: AppColors.primary200,
        enableFeedback: true,
      ),
      child: Text(
        titleButton,
        style: AppTextStyle.secondaryText14Medium().copyWith(color: AppColors.black),
      ),
    );
  }
}
