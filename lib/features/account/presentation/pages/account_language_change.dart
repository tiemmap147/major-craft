import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/localization.dart';
import 'package:major_craft_application/core/widgets/shared/custom_divinder.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

@RoutePage()
class AccountLanguageChangePage extends StatefulWidget {
  const AccountLanguageChangePage({super.key});

  @override
  State<AccountLanguageChangePage> createState() => _AccountLanguageChangePageState();
}

class _AccountLanguageChangePageState extends State<AccountLanguageChangePage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return ScaffoldCommon(
      hasAppBar: true,
      title: Text(
        Lang.current.language,
        style: AppTextStyle.primaryText16Medium(),
      ),
      leading: InkWellWithFeedback(
        onTap: () => {
          context.router.pop(),
        },
        child: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: SvgPicture.asset(
            Assets.icons.accountBack.path,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => InkWellWithFeedback(
          onTap: () => setState(() {
            selected = index;
          }),
          inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
          child: LanguageChangeComponent(
            iconPath: MajorCraftData.listLanguage[index].iconPath,
            title: MajorCraftData.listLanguage[index].label,
            isSelected: selected == index,
          ),
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
          child: const CustomDivider(),
        ),
        itemCount: MajorCraftData.listLanguage.length,
      ),
    );
  }
}

class LanguageChangeComponent extends StatefulWidget {
  const LanguageChangeComponent({
    super.key,
    required this.iconPath,
    required this.title,
    required this.isSelected,
  });
  final String iconPath;
  final String title;
  final bool isSelected;
  @override
  State<LanguageChangeComponent> createState() => _LanguageChangeComponentState();
}

class _LanguageChangeComponentState extends State<LanguageChangeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                widget.iconPath,
                height: 14.h,
                width: 20.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                widget.title,
                style: AppTextStyle.secondaryText14Regular()
                    .copyWith(color: widget.isSelected ? AppColors.primary400 : AppColors.black),
              ),
            ],
          ),
          if (widget.isSelected)
            Container(
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.primary400, width: 1.5.h),
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary400,
                  shape: BoxShape.circle,
                ),
                width: 12.h,
                height: 12.h,
              ),
            )
          else
            Container(
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.neutral400, width: 1.5.h),
                ),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 12.h,
                height: 12.h,
              ),
            ),
        ],
      ),
    );
  }
}
