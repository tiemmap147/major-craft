import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/form_address.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/form_required_address.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/select_form_address.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_buttons.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_sizes.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

@RoutePage()
class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  bool isCollapse = true;
  late final TextEditingController controllerName;
  late final TextEditingController controllerPhone;
  late final TextEditingController controllerStressAddress;
  late final TextEditingController controllerEtc;
  late final TextEditingController controllerRegion;
  late final TextEditingController controllerZipCode;
  String nameError = '';
  String phoneError = '';
  String stressAddressError = '';
  String etcError = '';
  String regionError = '';
  String zipCodeError = '';
  bool checkBoxNewAddress = false;
  int checkBox = 0;
  List data = [1, 2, 3];
  @override
  void initState() {
    controllerName = TextEditingController();
    controllerPhone = TextEditingController();
    controllerStressAddress = TextEditingController();
    controllerEtc = TextEditingController();
    controllerRegion = TextEditingController();
    controllerZipCode = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCommon(
      hasAppBar: true,
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Lang.current.cart,
            style: AppTextStyle.primaryText16Medium().copyWith(color: AppColors.primary200),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '>',
            style: AppTextStyle.primaryText16Medium().copyWith(color: AppColors.primary200),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            Lang.current.shipping,
            style: AppTextStyle.primaryText16Medium(),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '>',
            style: AppTextStyle.primaryText16Medium().copyWith(color: AppColors.primary200),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            Lang.current.payment,
            style: AppTextStyle.primaryText16Medium().copyWith(color: AppColors.primary200),
          ),
        ],
      ),
      body: SizedBox(
        height: AppSizes.currentScreenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWellWithFeedback(
                          onTap: () => setState(
                            () => isCollapse = !isCollapse,
                          ),
                          inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Lang.current.shippingAddress,
                                  style: AppTextStyle.secondaryText14Medium(),
                                ),
                                Transform.rotate(
                                  angle: isCollapse ? pi : 0,
                                  child: SvgPicture.asset(Assets.icons.homeSearchCaretDown.path),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (!isCollapse)
                          const SizedBox()
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                width: AppSizes.currentScreenWidth,
                                // constraints: BoxConstraints(maxWidth: AppSizes.currentScreenWidth - 24.h),
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.fastOutSlowIn,
                                // padding: EdgeInsets.only(bottom: chooseCategories.isNotEmpty ? 8.h : 0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      // padding: EdgeInsets.only(left: 12.w),
                                      // constraints: BoxConstraints(maxHeight: 141.h),
                                      width: AppSizes.currentScreenWidth,
                                      child: Column(
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(minHeight: 41.h),
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                              // vertical: 12.h,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerName,
                                                  nameTag: Lang.current.fullName,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: nameError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (nameError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      nameError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  )
                                                else
                                                  const SizedBox(),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerPhone,
                                                  nameTag: Lang.current.phoneNumber,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: phoneError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (phoneError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      phoneError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerStressAddress,
                                                  nameTag: Lang.current.streetOrPOBox,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: stressAddressError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (stressAddressError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      stressAddressError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerEtc,
                                                  nameTag: Lang.current.aptSuiteBuildingFloor,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: etcError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (etcError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      etcError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomSelectFormAddress(
                                                  nameTag: Lang.current.country,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                  height: 32.h,
                                                  defaultString: 'Viet Nam',
                                                  listOfValue: const ['Viet Nam', 'Viet Nam1', 'Viet Nam2'],
                                                  selectedValue: 'Viet Nam',
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomSelectFormAddress(
                                                  nameTag: Lang.current.city,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                  height: 32.h,
                                                  defaultString: ' Da Nang',
                                                  listOfValue: const [' Da Nang', ' Da Nang1', ' Da Nang2'],
                                                  selectedValue: ' Da Nang',
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerRegion,
                                                  nameTag: Lang.current.stateProvinceRegion,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: regionError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (regionError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      regionError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerZipCode,
                                                  nameTag: Lang.current.zipCode,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: zipCodeError == '' ? false : true,
                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.neutral600),
                                                ),
                                                if (zipCodeError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      zipCodeError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                CustomTextFormRequiredAddress(
                                                  height: 32.h,
                                                  context: context,
                                                  controller: controllerName,
                                                  nameTag: Lang.current.deliveryNote,
                                                  radius: 4.r,
                                                  prefixIcon: Assets.icons.loginEmail.path,
                                                  textInputType: TextInputType.emailAddress,
                                                  hasError: nameError == '' ? false : true,

                                                  // onChanged: onChange,
                                                  // validator: validator,
                                                  // onFieldSubmitted: onFieldSubmitted,
                                                  nameTagStyle: AppTextStyle.secondaryText14Regular()
                                                      .copyWith(color: AppColors.black),
                                                ),
                                                if (nameError != '')
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6.h),
                                                    child: Text(
                                                      nameError,
                                                      style: AppTextStyle.secondaryText14Regular()
                                                          .copyWith(color: AppColors.sematicError),
                                                    ),
                                                  )
                                                else
                                                  const SizedBox(),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(
                                                          color: AppColors.neutral400,
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Checkbox(
                                                        activeColor: AppColors.primary300,
                                                        value: checkBoxNewAddress,
                                                        onChanged: (a) => {
                                                          setState(() {
                                                            checkBoxNewAddress = !checkBoxNewAddress;
                                                          }),
                                                        },
                                                        side: BorderSide.none,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                      Lang.current.setDefaultAddress,
                                                      style: AppTextStyle.secondaryText14Regular(),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    children: [
                      Container(
                        color: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: Image.asset(
                                Assets.images.banner1.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTextStyle.smallText12Regular().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cast Rod XC Phải',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.smallText12Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'x1',
                                        style: AppTextStyle.secondaryText14Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '320.000 ₫',
                                    style: AppTextStyle.smallText12Medium().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: Image.asset(
                                Assets.images.banner2.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTextStyle.smallText12Regular().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cast Rod XC Phải',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.smallText12Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'x1',
                                        style: AppTextStyle.secondaryText14Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '320.000 ₫',
                                    style: AppTextStyle.smallText12Medium().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.sematicBlueLight,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Lang.current.shippingUnit,
                              style: AppTextStyle.smallText12Regular().copyWith(
                                color: AppColors.primary400,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              height: 1.h,
                              width: AppSizes.currentScreenWidth,
                              color: AppColors.neutral300,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.fromBorderSide(
                                          BorderSide(
                                            width: 1.5,
                                            color: AppColors.primary400,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        height: 15.h,
                                        width: 15.w,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primary400,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'VN Post',
                                          style: AppTextStyle.smallText12Regular().copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          '(15 - 19 October, 2023)',
                                          style: AppTextStyle.smallText12Regular().copyWith(
                                            color: AppColors.neutral600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '20.000 ₫',
                                  style: AppTextStyle.smallText12Medium().copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    children: [
                      Container(
                        color: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: Image.asset(
                                Assets.images.banner1.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTextStyle.smallText12Regular().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cast Rod XC Phải',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.smallText12Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'x1',
                                        style: AppTextStyle.secondaryText14Regular().copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '320.000 ₫',
                                    style: AppTextStyle.smallText12Medium().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.sematicBlueLight,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Lang.current.shippingUnit,
                              style: AppTextStyle.smallText12Regular().copyWith(
                                color: AppColors.primary400,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              height: 1.h,
                              width: AppSizes.currentScreenWidth,
                              color: AppColors.neutral300,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.fromBorderSide(
                                          BorderSide(
                                            width: 1.5,
                                            color: AppColors.primary400,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        height: 15.h,
                                        width: 15.w,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primary400,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'VN Post',
                                          style: AppTextStyle.smallText12Regular().copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          '(15 - 19 October, 2023)',
                                          style: AppTextStyle.smallText12Regular().copyWith(
                                            color: AppColors.neutral600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '20.000 ₫',
                                  style: AppTextStyle.smallText12Medium().copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    color: AppColors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${Lang.current.subtotal} (2)',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    '960.000 ₫',
                                    style: AppTextStyle.secondaryText14Semibold().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Lang.current.shippingAndHandling,
                                    style: AppTextStyle.secondaryText14Regular().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    '₫',
                                    style: AppTextStyle.secondaryText14Semibold().copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Lang.current.discount,
                                    style: AppTextStyle.secondaryText14Regular().copyWith(
                                      color: AppColors.sematicSuccess,
                                    ),
                                  ),
                                  Text(
                                    '-30.000 ₫',
                                    style: AppTextStyle.secondaryText14Semibold().copyWith(
                                      color: AppColors.sematicSuccess,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Lang.current.freeship,
                                    style: AppTextStyle.secondaryText14Regular().copyWith(
                                      color: AppColors.sematicSuccess,
                                    ),
                                  ),
                                  Text(
                                    '-₫',
                                    style: AppTextStyle.secondaryText14Semibold().copyWith(
                                      color: AppColors.sematicSuccess,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.h,
                          width: AppSizes.currentScreenWidth,
                          color: AppColors.neutral300,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 12.w,
                            right: 12.w,
                            top: 8.h,
                            bottom: 12.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Lang.current.orderTotal,
                                style: AppTextStyle.primaryText16Regular().copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                '970.000 ₫',
                                style: AppTextStyle.secondaryText14Semibold().copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h + 92.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  top: 12.h,
                  left: 12.w,
                  right: 12.w,
                  bottom: 40.h,
                ),
                child: AppButtons.primaryButton(
                  titleButton: '${Lang.current.payNow} (970.000 ₫)',
                  isDisable: !checkBoxNewAddress,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
