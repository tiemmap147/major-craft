import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/login/presentation/bloc/login_bloc.dart';
import 'package:major_craft_application/features/login/presentation/widgets/form_login.dart';
import 'package:major_craft_application/features/login/presentation/widgets/form_sign_up.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => DependencyInjection.instance(),
      child: const LoginWrapper(),
    );
  }
}

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({super.key});

  @override
  State<LoginWrapper> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> with TickerProviderStateMixin {
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerPassword;
  late final TextEditingController controllerEmailSignUp;
  late final TextEditingController controllerPasswordSignUp;
  late final TextEditingController controllerNameSignUp;
  late final TextEditingController controllerConfirmPasswordSignUp;
  late final TabController tabController;
  String emailError = '';
  String passwordError = '';
  String emailSignUpError = '';
  String nameSignUpError = '';
  String passwordSignUpError = '';
  String confirmPasswordSignUpError = '';
  int checkIndexTabbar = 0;
  bool checkBox = false;
  bool passwordVisible = false;
  bool passwordSignUpVisible = false;
  bool confirmPasswordSignUpVisible = false;
  int isCheckCharacters = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerEmailSignUp = TextEditingController();
    controllerPasswordSignUp = TextEditingController();
    controllerNameSignUp = TextEditingController();
    controllerConfirmPasswordSignUp = TextEditingController();
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
                            context.router.pop(),
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
                            'Login',
                            style: AppTextStyle.primaryText16Medium(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 71.h,
                child: Center(
                  child: Text(
                    'Welcome to Major Craft',
                    style: AppTextStyle.subText18Semibold().copyWith(color: Colors.black),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 49.h,
                child: TabBar(
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: AppColors.primary400, width: 2),
                  ),
                  onTap: (value) => {
                    FocusScope.of(context).unfocus(),
                    if (value != checkIndexTabbar)
                      setState(() {
                        checkIndexTabbar = value;
                      }),
                  },
                  tabs: [
                    SizedBox(
                      width: AppSizes.currentScreenWidth / 2,
                      child: Center(
                        child: Text(
                          'Login',
                          style: AppTextStyle.secondaryText14Medium()
                              .copyWith(color: checkIndexTabbar == 0 ? AppColors.primary400 : AppColors.neutral600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.currentScreenWidth / 2,
                      child: Center(
                        child: Text(
                          'Create account',
                          style: AppTextStyle.secondaryText14Medium()
                              .copyWith(color: checkIndexTabbar == 1 ? AppColors.primary400 : AppColors.neutral600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    //login
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomTextForm(
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
                              height: 16.h,
                            ),
                            CustomTextForm(
                              context: context,
                              controller: controllerPassword,
                              label: 'example@gmail.com',
                              nameTag: 'Password',
                              passwordVisible: passwordVisible,
                              changeVisible: () => {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                }),
                              },
                              isPassword: !passwordVisible,
                              textInputType: TextInputType.visiblePassword,
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginPassword.path,
                              hasError: passwordError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
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
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
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
                                          value: checkBox,
                                          onChanged: (a) => {
                                            setState(() {
                                              checkBox = !checkBox;
                                            }),
                                          },
                                          side: BorderSide.none,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        'Remember me',
                                        style: AppTextStyle.secondaryText14Regular().copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: pushResetPasswordPage,
                                  child: Text(
                                    'Forgot password',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.primary300),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40.h,
                              margin: EdgeInsets.symmetric(vertical: 24.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: controllerEmail.text.isNotEmpty &&
                                        controllerPassword.text.isNotEmpty &&
                                        controllerEmail.text != '' &&
                                        controllerPassword.text != ''
                                    ? AppColors.primary300
                                    : AppColors.primary200,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Log in',
                                style: AppTextStyle.primaryText16Medium().copyWith(color: Colors.white),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don’t have an account?  ',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: AppTextStyle.secondaryText14Regular()
                                        .copyWith(color: AppColors.primary300, decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      height: 1,
                                      color: AppColors.neutral300,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Text(
                                      'OR',
                                      style:
                                          AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      height: 1,
                                      color: AppColors.neutral300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 44.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(Assets.icons.loginGoogle.path),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //SignUp
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomTextFormSignUp(
                              context: context,
                              controller: controllerNameSignUp,
                              label: 'example@gmail.com',
                              nameTag: 'Full name (First and Last name)',
                              radius: 4.r,
                              prefixIcon: Assets.icons.signUpName.path,
                              hasError: nameSignUpError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (nameSignUpError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  nameSignUpError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              )
                            else
                              const SizedBox(),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormSignUp(
                              context: context,
                              controller: controllerEmailSignUp,
                              label: 'example@gmail.com',
                              nameTag: 'Email',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: emailSignUpError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (emailSignUpError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  emailSignUpError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              )
                            else
                              const SizedBox(),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextForm(
                              context: context,
                              controller: controllerPasswordSignUp,
                              label: 'example@gmail.com',
                              nameTag: 'Password',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginPassword.path,
                              hasError: passwordSignUpError == '' ? false : true,
                              onChanged: onChangePasswordSignUp,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                              passwordVisible: passwordSignUpVisible,
                              changeVisible: () => {
                                setState(() {
                                  passwordSignUpVisible = !passwordSignUpVisible;
                                }),
                              },
                              isPassword: !passwordSignUpVisible,
                            ),
                            if (passwordSignUpError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  passwordSignUpError,
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
                            CustomTextFormSignUp(
                              context: context,
                              controller: controllerConfirmPasswordSignUp,
                              label: 'example@gmail.com',
                              nameTag: 'Confirm Password',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginPassword.path,
                              hasError: confirmPasswordSignUpError == '' ? false : true,
                              onChanged: onChange,
                              validator: validator,
                              onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                              passwordVisible: confirmPasswordSignUpVisible,
                              changeVisible: () => {
                                setState(() {
                                  confirmPasswordSignUpVisible = !confirmPasswordSignUpVisible;
                                }),
                              },
                              isPassword: !confirmPasswordSignUpVisible,
                            ),
                            if (confirmPasswordSignUpError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  confirmPasswordSignUpError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              )
                            else
                              const SizedBox(),
                            Container(
                              height: 40.h,
                              margin: EdgeInsets.symmetric(vertical: 24.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: controllerNameSignUp.text.isNotEmpty &&
                                        controllerEmailSignUp.text.isNotEmpty &&
                                        controllerNameSignUp.text != '' &&
                                        controllerEmailSignUp.text != '' &&
                                        controllerPasswordSignUp.text.isNotEmpty &&
                                        controllerConfirmPasswordSignUp.text.isNotEmpty &&
                                        controllerPasswordSignUp.text != '' &&
                                        controllerConfirmPasswordSignUp.text != ''
                                    ? AppColors.primary300
                                    : AppColors.primary200,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Create',
                                style: AppTextStyle.primaryText16Medium().copyWith(color: Colors.white),
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

  pushResetPasswordPage() {
    context.router.push(const ResetPasswordRoute());
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

  String? onChangePasswordSignUp(String? string) {
    isCheckCharacters = onCheckCharacters(controllerPasswordSignUp.text);
    setState(() {});

    return '';
  }

  String? onChange(String? string) {
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
