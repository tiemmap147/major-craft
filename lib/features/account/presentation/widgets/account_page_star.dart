import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/custom_divinder.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

class AccountPageStar extends StatelessWidget {
  const AccountPageStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Lang.current.youHave, style: AppTextStyle.secondaryText14Regular()),
                Row(
                  children: [
                    SvgPicture.asset(Assets.icons.accountStar.path),
                    Text('100 ${Lang.current.points}', style: AppTextStyle.subText18Semibold()),
                  ],
                ),
              ],
            ),
          ),
          const CustomDivider(),

          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
          //   decoration: const BoxDecoration(
          //     border: Border(
          //       top: BorderSide(
          //         color: AppColors.neutral300,
          //       ),
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       SvgPicture.asset(Assets.icons.accountReceipt.path),
          //       SizedBox(
          //         width: AppSizes.w8.w,
          //       ),
          //       Text(
          //         'History Transaction',
          //         style: AppTextStyle.secondaryText14Regular(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
