import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

class AccountPageHeader extends StatelessWidget {
  const AccountPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary500,
      padding: EdgeInsets.all(12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48.w,
                height: 48.h,
                child: CircleAvatar(
                  backgroundImage: AssetImage(Assets.images.banner1.path),
                ),
              ),
              SizedBox(
                width: AppSizes.w8.w,
              ),
              Text(
                '${Lang.current.hello}, Thu',
                style: AppTextStyle.primaryText16Medium(),
              ),
            ],
          ),
          InkWellWithFeedback(
            onTap: () => {
              context.router.push(const AccountEditProfileRoute()),
            },
            child: SvgPicture.asset(Assets.icons.accountEdit.path),
          ),
        ],
      ),
    );
  }
}
