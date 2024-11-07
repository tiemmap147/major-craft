import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/localization/localization.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/input_common.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_buttons.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class AccountEditProfilePage extends StatefulWidget {
  const AccountEditProfilePage({super.key});

  @override
  State<AccountEditProfilePage> createState() => _AccountEditProfilePageState();
}

class _AccountEditProfilePageState extends State<AccountEditProfilePage> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  String nameError = '';
  String phoneError = '';
  String emailError = '';
  int value = -1;

  @override
  void initState() {
    super.initState();
    nameEditingController.text = 'Thu Thu';
    phoneEditingController.text = '(033) 375-6060';
    emailEditingController.text = 'thu123@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCommon(
      hasAppBar: true,
      title: Text(
        Lang.current.editProfile,
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
      body: SizedBox(
        height: AppSizes.currentScreenHeight,
        child: Stack(
          children: [
            Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSizes.h12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 80.h,
                              width: 80.w,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(Assets.images.banner1.path),
                              ),
                            ),
                            // SvgPicture.asset(Assets.icons.accountClose.path),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.h8.h,
                        ),
                        SizedBox(
                          height: 32.h,
                          width: 134.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                              ),
                              side: const BorderSide(
                                color: AppColors.black,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              Lang.current.changeAvatar,
                              style: AppTextStyle.secondaryText14Regular(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.h24.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputCommon(
                            label: '${Lang.current.fullName}*',
                            hintText: Lang.current.fullName,
                            textEditingController: nameEditingController,
                          ),
                          if (nameError != '')
                            Container(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Text(
                                nameError,
                                style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                              ),
                            )
                          else
                            const SizedBox(),
                          SizedBox(
                            height: AppSizes.h8.h,
                          ),
                          InputCommon(
                            label: '${Lang.current.phoneNumber}*',
                            hintText: Lang.current.phoneNumber,
                            textInputType: TextInputType.phone,
                            textEditingController: phoneEditingController,
                          ),
                          if (phoneError != '')
                            Container(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Text(
                                phoneError,
                                style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                              ),
                            )
                          else
                            const SizedBox(),
                          SizedBox(
                            height: AppSizes.h8.h,
                          ),
                          InputCommon(
                            label: Lang.current.email,
                            hintText: Lang.current.email,
                            textInputType: TextInputType.emailAddress,
                            textEditingController: emailEditingController,
                          ),
                          if (emailError != '')
                            Container(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Text(
                                emailError,
                                style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                              ),
                            )
                          else
                            const SizedBox(),
                          SizedBox(
                            height: AppSizes.h8.h,
                          ),
                          // const AccountPageGender(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Lang.current.gender,
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
                                                        color: value == e.key
                                                            ? AppColors.primary400
                                                            : AppColors.neutral400,
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
                          ),
                          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                        ],
                      ),
                    ),
                  ],
                ),
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
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
                child: AppButtons.primaryButton(
                  isDisable: value == -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
