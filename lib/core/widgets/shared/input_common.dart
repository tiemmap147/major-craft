import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/theme/theme.dart';

class InputCommon extends StatelessWidget {
  const InputCommon({
    super.key,
    required this.label,
    required this.hintText,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
  });

  final String label;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'Full name (First and Last name)*',
          label,
          style: AppTextStyle.secondaryText14Regular(),
        ),
        SizedBox(
          height: AppSizes.h6.h,
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 12.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(
                color: AppColors.neutral300, // Change this color to customize the border color
              ),
            ),
            isDense: true,
            hintStyle: AppTextStyle.secondaryText14Regular().copyWith(
              color: AppColors.neutral400,
            ),
            hintText: hintText,
          ),
          style: AppTextStyle.secondaryText14Regular(),
          keyboardType: textInputType,
        ),
      ],
    );
  }
}
