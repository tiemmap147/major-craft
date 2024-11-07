import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/theme/theme.dart';

class AccountPageGender extends StatefulWidget {
  const AccountPageGender({super.key});

  @override
  State<AccountPageGender> createState() => _AccountPageGenderState();
}

class _AccountPageGenderState extends State<AccountPageGender> {
  int value = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: AppTextStyle.secondaryText14Regular(),
          ),
          SizedBox(
            height: AppSizes.h4.h,
          ),
          SizedBox(
            width: AppSizes.currentScreenWidth - 96.w - 12.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: MajorCraftData.sexMap.entries
                  .map(
                    (e) => InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      onTap: () => setState(() {
                        value = e.key;
                      }),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.fromBorderSide(
                                BorderSide(
                                  width: 1.5,
                                  color: value == e.key ? AppColors.primary400 : AppColors.neutral400,
                                ),
                              ),
                            ),
                            child: Container(
                              height: 15.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: value == e.key ? AppColors.primary400 : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSizes.w8.w,
                          ),
                          Text(
                            e.value,
                            style: AppTextStyle.secondaryText14Regular(),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
