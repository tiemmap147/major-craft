import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/my_address/presentation/bloc/my_address_bloc.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/form_address.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/form_required_address.dart';
import 'package:major_craft_application/features/my_address/presentation/widgets/select_form_address.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAddressBloc>(
      create: (context) => DependencyInjection.instance(),
      child: const MyAddressWrapper(),
    );
  }
}

class MyAddressWrapper extends StatefulWidget {
  const MyAddressWrapper({super.key});

  @override
  State<MyAddressWrapper> createState() => _MyAddressWrapperState();
}

class _MyAddressWrapperState extends State<MyAddressWrapper> with TickerProviderStateMixin {
  late final TabController tabController;
  late final PageController pageController;

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
    tabController = TabController(length: 3, vsync: this);
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
                            if (pageController.page == 1)
                              {
                                pageController.jumpToPage(0),
                              }
                            else
                              {
                                context.router.pop(),
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
                            'My Address',
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
                  onPageChanged: (value) {},
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(minHeight: 41.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            ...data.asMap().entries.map(
                                  (e) => InkWell(
                                    onTap: () => {
                                      setState(() {
                                        checkBox = e.key;
                                      }),
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      checkBox == e.key ? AppColors.primary300 : AppColors.neutral400,
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: checkBox == e.key ? AppColors.primary300 : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(top: 1.5.h),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      constraints: BoxConstraints(maxWidth: 250.w),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Thu Thu',
                                                            style: AppTextStyle.secondaryText14Medium(),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(
                                                            width: 8.w,
                                                          ),
                                                          Text(
                                                            '(033) 375-6060',
                                                            style: AppTextStyle.secondaryText14Medium(),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      'Edit',
                                                      style: AppTextStyle.secondaryText14Regular().copyWith(
                                                        decoration: TextDecoration.underline,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(maxWidth: 250.w),
                                                  child: Text(
                                                    '503 Trung Nu Vuong, Hai CHau, Da Nang, Viet Nam',
                                                    style: AppTextStyle.smallText12Regular()
                                                        .copyWith(color: AppColors.neutral500),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            InkWell(
                              onTap: () => {
                                pageController.jumpToPage(1),
                              },
                              child: SizedBox(
                                height: 32.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        Assets.icons.myAddressAddNew.path,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      'Add new address',
                                      style: AppTextStyle.secondaryText14Regular().copyWith(
                                        color: AppColors.primary400,
                                      ),
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
                      child: Container(
                        constraints: BoxConstraints(minHeight: 41.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormRequiredAddress(
                              height: 32.h,
                              context: context,
                              controller: controllerName,
                              nameTag: 'Full name (First and Last name)',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: nameError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
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
                              height: 8.h,
                            ),
                            CustomTextFormRequiredAddress(
                              height: 32.h,
                              context: context,
                              controller: controllerPhone,
                              nameTag: 'Phone number',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: phoneError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (phoneError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  phoneError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormRequiredAddress(
                              height: 32.h,
                              context: context,
                              controller: controllerStressAddress,
                              nameTag: 'Street address or P.O Box',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: stressAddressError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (stressAddressError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  stressAddressError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormAddress(
                              height: 32.h,
                              context: context,
                              controller: controllerEtc,
                              nameTag: 'Apt, suite, building, floor, etc',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: etcError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (etcError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  etcError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomSelectFormAddress(
                              nameTag: 'Country',
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                              height: 32.h,
                              defaultString: 'Viet Nam',
                              listOfValue: const ['Viet Nam', 'Viet Nam1', 'Viet Nam2'],
                              selectedValue: 'Viet Nam',
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomSelectFormAddress(
                              nameTag: 'City',
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
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
                              nameTag: 'State/Province/Region',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: regionError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (regionError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  regionError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormRequiredAddress(
                              height: 32.h,
                              context: context,
                              controller: controllerZipCode,
                              nameTag: 'Zip code',
                              radius: 4.r,
                              prefixIcon: Assets.icons.loginEmail.path,
                              textInputType: TextInputType.emailAddress,
                              hasError: zipCodeError == '' ? false : true,
                              // onChanged: onChange,
                              // validator: validator,
                              // onFieldSubmitted: onFieldSubmitted,
                              nameTagStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
                            ),
                            if (zipCodeError != '')
                              Container(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  zipCodeError,
                                  style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicError),
                                ),
                              ),
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
                                  'Set as my default address',
                                  style: AppTextStyle.secondaryText14Regular(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
}
