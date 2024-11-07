import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_buttons.dart';
import 'package:major_craft_application/theme/theme.dart';

class HomeSearchResultEmptyComponent extends StatefulWidget {
  const HomeSearchResultEmptyComponent({super.key});

  @override
  State<HomeSearchResultEmptyComponent> createState() => _HomeSearchResultEmptyComponentState();
}

class _HomeSearchResultEmptyComponentState extends State<HomeSearchResultEmptyComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        Image.asset(
          Assets.images.searchResultNotFound.path,
          width: 152.h,
          height: 152.h,
        ),
        SizedBox(
          height: AppSizes.h16.h,
        ),
        Text(
          "We couldn't find a match",
          style: AppTextStyle.subText18Semibold().copyWith(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSizes.h4.h,
        ),
        Text(
          'Please enter another keyword or return home to explore more',
          style: AppTextStyle.primaryText16Regular().copyWith(color: AppColors.neutral700),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSizes.h16.h,
        ),
        AppButtons.primaryButton(
          buttonWDesignWidth: 122,
          titleButton: 'Back Home',
          onTap: () => context.router.popUntilRoot(),
        ),
      ],
    );
  }
}
