import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:major_craft_application/features/reset_password/presentation/widgets/form_reset_password.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => DependencyInjection.instance(),
      child: const ResetPasswordWrapper(),
    );
  }
}

class ResetPasswordWrapper extends StatefulWidget {
  const ResetPasswordWrapper({super.key});

  @override
  State<ResetPasswordWrapper> createState() => _ResetPasswordWrapperState();
}

class _ResetPasswordWrapperState extends State<ResetPasswordWrapper> with TickerProviderStateMixin {
  final PinTheme defaultPinTheme = PinTheme(
    width: 60.w,
    height: 40.h,
    textStyle: AppTextStyle.primaryText16Medium().copyWith(color: Colors.black),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral400),
      borderRadius: BorderRadius.circular(4),
    ),
  );
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerPassword;
  late final TextEditingController controllerConfirmPassword;
  late final TextEditingController controllerOtp;
  late final PageController pageController;
  String titleAppbar = 'Email verification';
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  bool pinOtp = false;
  bool passwordVisible = false;
  int isCheckCharacters = 0;
  @override
  void initState() {
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerConfirmPassword = TextEditingController();
    controllerOtp = TextEditingController();

    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: SizedBox(
          height: AppSizes.currentScreenHeight,
          child: Column(
            children: [
              Container(
                color: AppColors.primary500,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  width: AppSizes.currentScreenWidth,
                  color: AppColors.primary500,
                  child: SizedBox(
                    height: 40.h,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => {
                            if (pageController.page == 0)
                              {context.router.pop()}
                            else
                              {
                                pageController.jumpToPage(
                                  (pageController.page! - 1).toInt(),
                                ),
                              },
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            titleAppbar,
                            style: AppTextStyle.primaryText16Medium(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) => {
                    if (pageController.page == 0)
                      {
                        setState(() {
                          titleAppbar = 'Email verification';
                        }),
                      }
                    else if (pageController.page == 1)
                      {
                        setState(() {
                          titleAppbar = 'Email verification';
                        }),
                      }
                    else
                      {
                        setState(() {
                          titleAppbar = 'Reset password';
                        }),
                      },
                  },
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        child: Column(
                          children: [
                            CustomTextFormResetPassword(
                              context: context,
                              controller: controllerEmail,
                              label: 'example@gmail.com',
                              nameTag: 'Email',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: emailError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              colorTag: Colors.black,
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
                            InkWell(
                              onTap: () => {
                                if (controllerEmail.text.isNotEmpty && controllerEmail.text != '')
                                  pageController.jumpToPage(
                                    1,
                                  )
                                else
                                  null,
                              },
                              child: Container(
                                height: 40.h,
                                margin: EdgeInsets.symmetric(vertical: 24.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: controllerEmail.text.isNotEmpty && controllerEmail.text != ''
                                      ? AppColors.primary300
                                      : AppColors.primary200,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Next',
                                  style: AppTextStyle.primaryText16Medium().copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 24.h,
                                top: 12.h,
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Please enter the 4-digit code that was sent to ',
                                      style: AppTextStyle.primaryText16Regular().copyWith(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'thu123@gmail.com',
                                      style: AppTextStyle.primaryText16Semibold()
                                          .copyWith(color: AppColors.black, decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Pinput(
                              controller: controllerOtp,
                              defaultPinTheme: defaultPinTheme,
                              validator: (value) {
                                if (value == '9999') {
                                  setState(() {
                                    pinOtp = true;
                                  });
                                  return null;
                                } else {
                                  return 'This is an error message.';
                                }
                              },
                              onChanged: (value) => {
                                if (value != '9999')
                                  {
                                    setState(() {
                                      pinOtp = false;
                                    }),
                                  },
                              },
                            ),
                            InkWell(
                              onTap: () => {
                                if (pinOtp)
                                  pageController.jumpToPage(
                                    2,
                                  )
                                else
                                  null,
                              },
                              child: Container(
                                height: 40.h,
                                margin: EdgeInsets.only(top: 24.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: pinOtp ? AppColors.primary300 : AppColors.primary200,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Verify',
                                  style: AppTextStyle.primaryText16Medium().copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 24.h,
                                top: 12.h,
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Did not get it?   ',
                                      style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'Resend code',
                                      style: AppTextStyle.secondaryText14Regular()
                                          .copyWith(color: AppColors.primary200, decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormResetPassword(
                              context: context,
                              controller: controllerPassword,
                              label: 'Enter your password',
                              nameTag: 'Password',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: passwordError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              colorTag: Colors.black,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (passwordError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  passwordError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              )
                            else
                              const SizedBox(),
                            Container(
                              padding: EdgeInsets.only(top: 6.h, bottom: 16.h),
                              child: Text(
                                'At least 1 number and 8 characters',
                                style: AppTextStyle.secondaryText14Regular().copyWith(
                                  color: isCheckCharacters == 1
                                      ? AppColors.sematicSuccess
                                      : isCheckCharacters == -1
                                          ? AppColors.sematicError
                                          : AppColors.neutral600,
                                ),
                              ),
                            ),
                            CustomTextFormResetPassword(
                              context: context,
                              controller: controllerConfirmPassword,
                              label: 'Enter your password',
                              nameTag: 'Confirm Password',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: confirmPasswordError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              colorTag: Colors.black,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (confirmPasswordError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  confirmPasswordError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              )
                            else
                              const SizedBox(),
                            InkWell(
                              onTap: () => {
                                if (controllerConfirmPassword.text.isNotEmpty &&
                                    controllerConfirmPassword.text != '' &&
                                    controllerPassword.text.isNotEmpty &&
                                    controllerPassword.text != '')
                                  {
                                    if (controllerConfirmPassword.text == controllerPassword.text)
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: AppColors.primary300,
                                            content: Text('Success!'),
                                          ),
                                        ),
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text('Fail!'),
                                          ),
                                        ),
                                      },
                                  },
                              },
                              child: Container(
                                height: 40.h,
                                margin: EdgeInsets.symmetric(vertical: 24.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: controllerConfirmPassword.text.isNotEmpty &&
                                          controllerConfirmPassword.text != '' &&
                                          controllerPassword.text.isNotEmpty &&
                                          controllerPassword.text != ''
                                      ? AppColors.primary300
                                      : AppColors.primary200,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Reset',
                                  style: AppTextStyle.primaryText16Medium().copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int onCheckCharacters(String password) {
    if (password.length >= 8 && password.contains(RegExp('[0-9]'))) {
      return 1;
    }
    if (password.length >= 8) {
      return -1;
    }
    return 0;
  }

  String? onChange(String? string) {
    if (pageController.page == 2) {
      isCheckCharacters = onCheckCharacters(controllerPassword.text);
    }
    setState(() {});
    return '';
  }

  String? validator(String? string) {
    return '';
  }

  String? onFieldSubmitted(String? string) {
    return '';
  }
}
