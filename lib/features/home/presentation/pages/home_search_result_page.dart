import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/features/home/presentation/widgets/home_search_result_empty_component.dart';
import 'package:major_craft_application/features/home/presentation/widgets/home_search_result_has_data_component.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_buttons.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class HomeSearchResultPage extends StatefulWidget {
  const HomeSearchResultPage({super.key, required this.searchText});
  final String searchText;

  @override
  State<HomeSearchResultPage> createState() => _HomeSearchResultPageState();
}

class _HomeSearchResultPageState extends State<HomeSearchResultPage> {
  late final TextEditingController searchController;
  late final FocusNode focusNode;
  late final PageController pageController;

  late final TextEditingController minEditingController;
  late final TextEditingController maxEditingController;

  late final FocusNode minFocusNode;
  late final FocusNode maxFocusNode;

  late final ScrollController scrollController;

  int selectedCategory = -1;
  int selectedChildrenCategory = -1;
  int selectedSubChildrenCategory = -1;
  int selectedPrice = -1;

  List<String> chooseCategories = [];
  List<String> subChooseCategories = [];

  String parentCategory = '';
  String childrenCategory = '';
  String subChildrenCategory = '';
  String price = '';

  bool isCollapseCategory = false;
  bool isCollapsePrice = false;
  bool isCollapseFilter = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    searchController = TextEditingController();
    pageController = PageController();
    searchController.text = widget.searchText;

    minEditingController = TextEditingController();
    maxEditingController = TextEditingController();

    scrollController = ScrollController();

    minFocusNode = FocusNode();
    maxFocusNode = FocusNode();

    minEditingController.addListener(() {
      if (minEditingController.text != '') {
        setState(() {
          selectedPrice = -1;
        });
      }
    });

    maxEditingController.addListener(() {
      if (maxEditingController.text != '') {
        setState(() {
          selectedPrice = -1;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    minEditingController.dispose();
    maxEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSearchBar(
      focusNode: focusNode,
      searchEditingController: searchController,
      searchBarType: SearchBarType.searchResultPage.index,
      onFilterTap: () => pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: widget.searchText == 'Fishing Rod'
            ? const HomeSearchResultEmptyComponent()
            : PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const HomeSearchResultHasDataComponent(),
                  Stack(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWellWithFeedback(
                                  onTap: () => {
                                    debugPrint('TAP TAP TAP >>>>'),
                                    setState(() {
                                      isCollapseFilter = !isCollapseFilter;
                                    }),
                                  },
                                  inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: AppColors.neutral300, width: 1.h)),
                                    ),
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(
                                      left: 12.w,
                                      right: 12.h,
                                      bottom: 12.h,
                                      top: 12.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Lang.current.filter,
                                          style: AppTextStyle.primaryText16Semibold().copyWith(color: AppColors.black),
                                        ),
                                        SvgPicture.asset(Assets.icons.homeSearchCaretUp.path),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isCollapseFilter) const SizedBox() else const HomeSearchResultHasDataComponent(),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWellWithFeedback(
                                  onTap: () => setState(() => isCollapseCategory = !isCollapseCategory),
                                  inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
                                  child: Container(
                                    padding: EdgeInsets.all(12.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Lang.current.categories,
                                          style: AppTextStyle.secondaryText14Medium(),
                                        ),
                                        Transform.rotate(
                                          angle: isCollapseCategory ? pi : 0,
                                          child: SvgPicture.asset(Assets.icons.homeSearchCaretDown.path),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isCollapseCategory)
                                  const SizedBox()
                                else
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AnimatedContainer(
                                          width: AppSizes.currentScreenWidth,
                                          constraints: BoxConstraints(maxWidth: AppSizes.currentScreenWidth - 24.h),
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.fastOutSlowIn,
                                          padding: EdgeInsets.only(bottom: chooseCategories.isNotEmpty ? 8.h : 0),
                                          child: Row(
                                            children: chooseCategories
                                                .map(
                                                  (e) => Text(
                                                    '$e / ',
                                                    style: AppTextStyle.smallText12Medium(),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                        Wrap(
                                          runSpacing: 8.h,
                                          spacing: 8.h,
                                          children: MajorCraftData.categoryMap.entries
                                              .map(
                                                (e) => InkWell(
                                                  onTap: () => {
                                                    setState(() {
                                                      selectedCategory = e.key;
                                                      selectedChildrenCategory = -1;
                                                      selectedSubChildrenCategory = -1;
                                                      subChooseCategories.clear();
                                                      if (!chooseCategories.contains(e.value)) {
                                                        chooseCategories.clear();
                                                        parentCategory = e.value;
                                                        chooseCategories.add(parentCategory);
                                                      }
                                                    }),
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                                      color: selectedCategory == e.key
                                                          ? AppColors.sematicBlueLight
                                                          : Colors.transparent,
                                                      border: Border.fromBorderSide(
                                                        BorderSide(
                                                          color: selectedCategory == e.key
                                                              ? AppColors.primary400
                                                              : AppColors.neutral300,
                                                        ),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
                                                    child: Text(
                                                      e.value,
                                                      style: AppTextStyle.smallText12Medium().copyWith(
                                                        color: selectedCategory == e.key
                                                            ? AppColors.primary400
                                                            : AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        AnimatedPadding(
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.fastOutSlowIn,
                                          padding: EdgeInsets.only(top: chooseCategories.isNotEmpty ? 12.h : 0),
                                          child: chooseCategories.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 1,
                                                      width: AppSizes.currentScreenWidth,
                                                      color: AppColors.neutral300,
                                                    ),
                                                    SizedBox(
                                                      height: AppSizes.h12.h,
                                                    ),
                                                    Wrap(
                                                      runSpacing: 8.h,
                                                      spacing: 8.h,
                                                      children: MajorCraftData.subCategory.entries
                                                          .map(
                                                            (e) => InkWell(
                                                              onTap: () => {
                                                                setState(() {
                                                                  selectedChildrenCategory = e.key;
                                                                  childrenCategory = e.value;
                                                                  selectedSubChildrenCategory = -1;
                                                                  if (!chooseCategories.contains(childrenCategory)) {
                                                                    chooseCategories.clear();
                                                                    chooseCategories.add(parentCategory);
                                                                    chooseCategories.add(childrenCategory);
                                                                  }

                                                                  if (!subChooseCategories.contains(e.value)) {
                                                                    subChooseCategories.clear();
                                                                    subChooseCategories.add(e.value);
                                                                  }
                                                                }),
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                                                  color: selectedChildrenCategory == e.key
                                                                      ? AppColors.sematicBlueLight
                                                                      : Colors.transparent,
                                                                  border: Border.fromBorderSide(
                                                                    BorderSide(
                                                                      color: selectedChildrenCategory == e.key
                                                                          ? AppColors.primary400
                                                                          : AppColors.neutral300,
                                                                    ),
                                                                  ),
                                                                ),
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 12.h,
                                                                  vertical: 8.h,
                                                                ),
                                                                child: Text(
                                                                  e.value,
                                                                  style: AppTextStyle.smallText12Medium().copyWith(
                                                                    color: selectedChildrenCategory == e.key
                                                                        ? AppColors.primary400
                                                                        : AppColors.black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                        ),
                                        AnimatedPadding(
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.fastOutSlowIn,
                                          padding: EdgeInsets.only(top: subChooseCategories.isNotEmpty ? 12.h : 0),
                                          child: subChooseCategories.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 1,
                                                      width: AppSizes.currentScreenWidth,
                                                      color: AppColors.neutral300,
                                                    ),
                                                    SizedBox(
                                                      height: AppSizes.h12.h,
                                                    ),
                                                    Wrap(
                                                      runSpacing: 8.h,
                                                      spacing: 8.h,
                                                      children: MajorCraftData.subChildrenCategory.entries
                                                          .map(
                                                            (e) => InkWell(
                                                              onTap: () => {
                                                                setState(() {
                                                                  selectedSubChildrenCategory = e.key;
                                                                  subChildrenCategory = e.value;
                                                                  if (!chooseCategories.contains(subChildrenCategory)) {
                                                                    chooseCategories.clear();
                                                                    chooseCategories.add(parentCategory);
                                                                    chooseCategories.add(childrenCategory);
                                                                    chooseCategories.add(subChildrenCategory);
                                                                  }
                                                                }),
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                                                  color: selectedSubChildrenCategory == e.key
                                                                      ? AppColors.sematicBlueLight
                                                                      : Colors.transparent,
                                                                  border: Border.fromBorderSide(
                                                                    BorderSide(
                                                                      color: selectedSubChildrenCategory == e.key
                                                                          ? AppColors.primary400
                                                                          : AppColors.neutral300,
                                                                    ),
                                                                  ),
                                                                ),
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: 12.h,
                                                                  vertical: 8.h,
                                                                ),
                                                                child: Text(
                                                                  e.value,
                                                                  style: AppTextStyle.smallText12Medium().copyWith(
                                                                    color: selectedSubChildrenCategory == e.key
                                                                        ? AppColors.primary400
                                                                        : AppColors.black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWellWithFeedback(
                                  onTap: () => setState(() => isCollapsePrice = !isCollapsePrice),
                                  inkWellFeedBackFor: InkWellFeedBackFor.tile.index,
                                  child: Container(
                                    padding: EdgeInsets.all(12.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Lang.current.price,
                                          style: AppTextStyle.secondaryText14Medium(),
                                        ),
                                        Transform.rotate(
                                          angle: isCollapsePrice ? pi : 0,
                                          child: SvgPicture.asset(Assets.icons.homeSearchCaretDown.path),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isCollapsePrice)
                                  const SizedBox()
                                else
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.h, right: 12.h, bottom: 12.h),
                                        child: Wrap(
                                          runSpacing: 8.h,
                                          spacing: 8.h,
                                          children: MajorCraftData.priceMap.entries
                                              .map(
                                                (e) => InkWell(
                                                  onTap: () => {
                                                    setState(() {
                                                      selectedPrice = e.key;

                                                      minEditingController.clear();
                                                      maxEditingController.clear();

                                                      minFocusNode.unfocus();
                                                      maxFocusNode.unfocus();
                                                    }),
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                                      color: selectedPrice == e.key
                                                          ? AppColors.sematicBlueLight
                                                          : Colors.transparent,
                                                      border: Border.fromBorderSide(
                                                        BorderSide(
                                                          color: selectedPrice == e.key
                                                              ? AppColors.primary400
                                                              : AppColors.neutral300,
                                                        ),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
                                                    child: Text(
                                                      e.value,
                                                      style: AppTextStyle.smallText12Medium().copyWith(
                                                        color: selectedPrice == e.key
                                                            ? AppColors.primary400
                                                            : AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextField(
                                            focusNode: minFocusNode,
                                            controller: minEditingController,
                                            decoration: InputDecoration(
                                              constraints: BoxConstraints(
                                                maxWidth: (AppSizes.currentScreenWidth - 24.w - 8.w) / 2,
                                              ),
                                              contentPadding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 12.w),
                                              fillColor: AppColors.neutral200,
                                              filled: true,
                                              isDense: true,
                                              hintStyle: AppTextStyle.secondaryText14Regular().copyWith(
                                                color: AppColors.neutral600,
                                              ),
                                              hintText: '\$ ${Lang.current.min}',
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                              ),
                                            ),
                                            style: AppTextStyle.secondaryText14Regular(),
                                            keyboardType: TextInputType.number,
                                            onTap: () => setState(() {
                                              selectedPrice = -1;
                                            }),
                                          ),
                                          SizedBox(
                                            width: AppSizes.w8.w,
                                          ),
                                          TextField(
                                            focusNode: maxFocusNode,
                                            controller: maxEditingController,
                                            decoration: InputDecoration(
                                              constraints: BoxConstraints(
                                                maxWidth: (AppSizes.currentScreenWidth - 24.w - 8.w) / 2,
                                              ),
                                              contentPadding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 12.w),
                                              fillColor: AppColors.neutral200,
                                              filled: true,
                                              isDense: true,
                                              hintStyle: AppTextStyle.secondaryText14Regular().copyWith(
                                                color: AppColors.neutral600,
                                              ),
                                              hintText: '\$ ${Lang.current.max}',
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                              ),
                                            ),
                                            style: AppTextStyle.secondaryText14Regular(),
                                            keyboardType: TextInputType.number,
                                            onTap: () => setState(() {
                                              selectedPrice = -1;
                                            }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.screenInsetBottom / 3,
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
                          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
                          child: Row(
                            children: [
                              AppButtons.primaryOutLineButton(
                                titleButton: Lang.current.clear,
                                buttonWDesignWidth: 171.5,
                                onTap: () {
                                  chooseCategories.clear();
                                  subChooseCategories.clear();
                                  selectedCategory = -1;
                                  selectedChildrenCategory = -1;
                                  selectedSubChildrenCategory = -1;
                                  selectedPrice = -1;
                                  isCollapseCategory = true;
                                  isCollapsePrice = true;
                                  isCollapseFilter = true;
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: AppSizes.w8.w,
                              ),
                              AppButtons.primaryButton(
                                buttonWDesignWidth: 171.5,
                                titleButton: Lang.current.apply,
                                onTap: () {
                                  minFocusNode.unfocus();
                                  maxFocusNode.unfocus();

                                  scrollController.animateTo(
                                    scrollController.position.minScrollExtent,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.fastOutSlowIn,
                                  );

                                  setState(() {
                                    isCollapseFilter = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
