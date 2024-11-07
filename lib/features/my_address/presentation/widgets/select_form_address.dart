import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/theme/theme.dart';

class CustomSelectFormAddress extends StatelessWidget {
  const CustomSelectFormAddress({
    Key? key,
    this.nameTag,
    this.nameTagStyle,
    this.height,
    required this.defaultString,
    required this.listOfValue,
    required this.selectedValue,
  }) : super(key: key);
  final String? nameTag;
  final TextStyle? nameTagStyle;
  final double? height;
  final String defaultString;
  final List<String> listOfValue;
  final String error = '';
  final String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nameTag != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    nameTag ?? '',
                    style: nameTagStyle ?? AppTextStyle.secondaryText14Medium(),
                  ),
                  Text(
                    '*',
                    style: nameTagStyle ?? AppTextStyle.secondaryText14Medium(),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],
          )
        else
          Container(),
        //  EdgeInsets.only(left: 12.w, right: 8.w)
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.neutral300),
          ),
          height: height ?? 40.h,
          child: Center(
            child: DropdownButton(
              isExpanded: true,
              hint: Row(
                children: [
                  SizedBox(width: 12.w),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 285.w,
                      child: Text(
                        defaultString,
                        style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                ],
              ),
              underline: const SizedBox(),
              icon: Row(
                children: [
                  const Icon(
                    Icons.expand_more,
                    size: 24,
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
              elevation: 10,
              value: selectedValue,
              items: listOfValue.map(buildDropdownMenu).toList(),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildDropdownMenu(String string) {
    return DropdownMenuItem(
      value: string,
      child: Row(
        children: [
          SizedBox(width: 12.w),
          SizedBox(
            width: 285.w,
            child: Text(
              string,
              style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
