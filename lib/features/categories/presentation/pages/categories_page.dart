import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/widgets/shared/custom_divinder.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final TextEditingController categoriesSearchController;
  late final FocusNode focusNode;
  int categoriesSelected = 0;
  bool isCollapseCategory = true;
  int subSelected = -1;

  @override
  void initState() {
    categoriesSearchController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    categoriesSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSearchBar(
      focusNode: focusNode,
      searchEditingController: categoriesSearchController,
      searchBarType: SearchBarType.home.index,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 92.w,
            height: AppSizes.currentScreenHeight -
                10.h -
                18.h -
                24.h -
                10.h -
                12.h -
                18.h -
                4.h -
                24.h -
                12.h -
                AppSizes.screenPaddingBottom,
            color: AppColors.neutral100,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: MajorCraftData.listCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          setState(() {
                            categoriesSelected = MajorCraftData.listCategories[index].id;
                            subSelected = -1;
                          }),
                        },
                        child: Container(
                          color: categoriesSelected == MajorCraftData.listCategories[index].id
                              ? AppColors.sematicBlueLight
                              : AppColors.neutral100,
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                MajorCraftData.listCategories[index].svgSrc,
                                colorFilter: ColorFilter.mode(
                                  categoriesSelected == MajorCraftData.listCategories[index].id
                                      ? AppColors.primary400
                                      : AppColors.neutral700,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                MajorCraftData.listCategories[index].title,
                                style: AppTextStyle.smallText12Regular().copyWith(
                                  color: categoriesSelected == MajorCraftData.listCategories[index].id
                                      ? AppColors.primary400
                                      : AppColors.neutral500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: AppColors.white,
            height: AppSizes.currentScreenHeight -
                10.h -
                18.h -
                24.h -
                10.h -
                12.h -
                18.h -
                4.h -
                24.h -
                12.h -
                AppSizes.screenPaddingBottom,
            width: AppSizes.currentScreenWidth - 92.w,
            child: ListView.separated(
              itemCount: MajorCraftData.listCategories[categoriesSelected].subCategories.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWellWithFeedback(
                      onTap: () => setState(
                        () => {
                          if (subSelected != MajorCraftData.listCategories[categoriesSelected].subCategories[index].id)
                            {
                              subSelected = MajorCraftData.listCategories[categoriesSelected].subCategories[index].id,
                            }
                          else
                            {
                              subSelected = -1,
                            },
                        },
                      ),
                      inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              MajorCraftData.listCategories[categoriesSelected].subCategories[index].title,
                              style: AppTextStyle.secondaryText14Medium(),
                            ),
                            Transform.rotate(
                              angle: MajorCraftData.listCategories[categoriesSelected].subCategories[index].id ==
                                      subSelected
                                  ? pi
                                  : 0,
                              child: SvgPicture.asset(Assets.icons.homeSearchCaretDown.path),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (MajorCraftData.listCategories[categoriesSelected].subCategories[index].id != subSelected)
                      const SizedBox()
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            width: AppSizes.currentScreenWidth,
                            constraints: BoxConstraints(maxWidth: AppSizes.currentScreenWidth - 24.h),
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.fastOutSlowIn,
                            // padding: EdgeInsets.only(bottom: chooseCategories.isNotEmpty ? 8.h : 0),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 12.w),
                                  constraints: BoxConstraints(maxHeight: 141.h),
                                  width: AppSizes.currentScreenWidth - 92.w,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          // shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: MajorCraftData.listCategories[categoriesSelected]
                                              .subCategories[subSelected].subSubCategories.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(right: 8.w),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100.w,
                                                    height: 100.h,
                                                    decoration: const BoxDecoration(
                                                      border: Border.fromBorderSide(
                                                        BorderSide(color: AppColors.neutral300),
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      MajorCraftData.listCategories[categoriesSelected]
                                                          .subCategories[subSelected].subSubCategories[index].imageSrc,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    MajorCraftData.listCategories[categoriesSelected]
                                                        .subCategories[subSelected].subSubCategories[index].title,
                                                    style: AppTextStyle.secondaryText14Regular()
                                                        .copyWith(color: AppColors.neutral600),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
                );
              },
              shrinkWrap: true,
              separatorBuilder: (context, index) => const CustomDivider(),
            ),
          ),
        ],
      ),
    );
  }
}
