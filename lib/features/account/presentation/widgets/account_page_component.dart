import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/theme/theme.dart';

class AccountPageComponent extends StatelessWidget {
  const AccountPageComponent({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.label,
    this.textColor,
    this.additionIconPath = '',
  });

  final VoidCallback onTap;
  final String iconPath;
  final String label;
  final Color? textColor;
  final String additionIconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: InkWellWithFeedback(
        onTap: onTap,
        inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.neutral300,
                  ),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                  ),
                  SizedBox(
                    width: AppSizes.w8.w,
                  ),
                  Text(
                    label,
                    style: AppTextStyle.secondaryText14Regular().copyWith(
                      color: textColor ?? AppColors.black,
                    ),
                    strutStyle: StrutStyle(
                      forceStrutHeight: true,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.w8.w,
                  ),
                  if (additionIconPath.isNotEmpty)
                    SvgPicture.asset(
                      additionIconPath,
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
