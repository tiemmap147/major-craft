import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/features/home/presentation/widgets/home_cart_component.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_sizes.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

class SearchBarHome extends StatefulWidget {
  const SearchBarHome({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    this.searchBarType = 0,
    this.onFilterTap,
    this.onArrowBackTap,
    this.onTextFieldSubmit,
    this.onTextFieldChange,
    this.onCartTap,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final int searchBarType;
  final VoidCallback? onFilterTap;
  final VoidCallback? onArrowBackTap;
  final Function(String)? onTextFieldSubmit;
  final Function(String)? onTextFieldChange;
  final VoidCallback? onCartTap;

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.searchPage.index
        ? SearchBarSearchPageComponenent(widget: widget)
        : widget.searchBarType == SearchBarType.searchResultPage.index
            ? SearchBarSearchResultPageComponenent(widget: widget)
            : widget.searchBarType == SearchBarType.productDetail.index
                ? SearchBarProductDetailComponenent(
                    widget: widget,
                  )
                : SearchBarSearchHomeComponent(widget: widget);
  }
}

class SearchBarSearchHomeComponent extends StatelessWidget {
  const SearchBarSearchHomeComponent({
    super.key,
    required this.widget,
  });

  final SearchBarHome widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4.r),
          gapPadding: 0,
        ),
        hintText: Lang.current.searchInMajorCraft,
        hintStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral500),
        // suffixIcon: widget.focusNode.hasFocus
        //     ? GestureDetector(
        //         onTap: widget.textEditingController.clear,
        //         child: Container(
        //           padding: EdgeInsets.only(right: 12.w, left: 12.w),
        //           child: SvgPicture.asset(
        //             Assets.images.closeSearchBarHome.path,
        //           ),
        //         ),
        //       )
        //     : null,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.h, left: 12.w, top: 8.h, bottom: 8.h),
          child: SvgPicture.asset(
            Assets.images.searchBarHome.path,
          ),
        ),
      ),
      style: AppTextStyle.secondaryText14Regular(),
      focusNode: widget.focusNode,
    );
  }
}

class SearchBarSearchPageComponenent extends StatelessWidget {
  const SearchBarSearchPageComponenent({
    super.key,
    required this.widget,
  });

  final SearchBarHome widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.currentScreenWidth - 24.w,
      child: Row(
        children: [
          InkWellWithFeedback(
            onTap: widget.onArrowBackTap ?? () {},
            child: SvgPicture.asset(Assets.icons.accountBack.path),
          ),
          SizedBox(
            width: AppSizes.w8.w,
          ),
          TextFormField(
            // onSubmitted: (value) => {
            //   widget.onTextFieldSubmit!(value),
            // },
            onChanged: (value) => {
              widget.onTextFieldChange!(value),
            },
            controller: widget.textEditingController,
            onFieldSubmitted: (value) => {
              widget.onTextFieldSubmit!(value),
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              constraints: BoxConstraints(
                maxWidth: AppSizes.currentScreenWidth - 24.w - 24.w - 8.w,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4.r),
                gapPadding: 0,
              ),
              hintText: Lang.current.searchInMajorCraft,
              hintStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral500),
              suffixIcon: GestureDetector(
                onTap: widget.textEditingController.clear,
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  child: SvgPicture.asset(
                    Assets.images.closeSearchBarHome.path,
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 8.h, left: 12.h, top: 8.h, bottom: 8.h),
                child: SvgPicture.asset(
                  Assets.images.searchBarHome.path,
                ),
              ),
            ),
            style: AppTextStyle.secondaryText14Regular(),
            focusNode: widget.focusNode,
          ),
        ],
      ),
    );
  }
}

class SearchBarSearchResultPageComponenent extends StatelessWidget {
  const SearchBarSearchResultPageComponenent({
    super.key,
    required this.widget,
  });

  final SearchBarHome widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.currentScreenWidth - 24.w,
      child: Row(
        children: [
          InkWellWithFeedback(
            onTap: () => context.router.pop(),
            child: SvgPicture.asset(Assets.icons.accountBack.path),
          ),
          SizedBox(
            width: AppSizes.w8.w,
          ),
          TextFormField(
            controller: widget.textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 12.h),
              constraints: BoxConstraints(
                maxWidth: AppSizes.currentScreenWidth - 24.w - 24.w - 8.w - 8.w - 24.w - 8.w - 53.w + 3.w,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4.r),
                gapPadding: 0,
              ),
              hintText: Lang.current.searchInMajorCraft,
              hintStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral500),
              suffixIcon: GestureDetector(
                onTap: widget.textEditingController.clear,
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  child: SvgPicture.asset(
                    Assets.images.closeSearchBarHome.path,
                  ),
                ),
              ),
            ),
            style: AppTextStyle.secondaryText14Regular(),
            focusNode: widget.focusNode,
          ),
          InkWellWithFeedback(
            onTap: widget.onFilterTap ?? () {},
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: SvgPicture.asset(Assets.icons.homeFilter.path),
            ),
          ),
          InkWell(
            onTap: widget.onCartTap,
            child: const HomeCartComponent(),
          ),
        ],
      ),
    );
  }
}

class SearchBarProductDetailComponenent extends StatelessWidget {
  const SearchBarProductDetailComponenent({
    super.key,
    required this.widget,
  });

  final SearchBarHome widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.currentScreenWidth - 24.w,
      child: Row(
        children: [
          InkWellWithFeedback(
            onTap: () => context.router.pop(),
            child: SvgPicture.asset(Assets.icons.accountBack.path),
          ),
          SizedBox(
            width: AppSizes.w8.w,
          ),
          InkWell(
            onTap: () => context.router.push(const HomeSearchRoute()),
            child: AbsorbPointer(
              child: TextFormField(
                controller: widget.textEditingController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 12.h),
                  constraints: BoxConstraints(
                    maxWidth: AppSizes.currentScreenWidth - 24.w - 8.w - 8.w - 24.w - 8.w - 53.w,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4.r),
                    gapPadding: 0,
                  ),
                  hintText: Lang.current.searchInMajorCraft,
                  hintStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral500),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.h, left: 12.w, top: 8.h, bottom: 8.h),
                    child: SvgPicture.asset(
                      Assets.images.searchBarHome.path,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: widget.textEditingController.clear,
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      child: SvgPicture.asset(
                        Assets.images.closeSearchBarHome.path,
                      ),
                    ),
                  ),
                ),
                style: AppTextStyle.secondaryText14Regular(),
                focusNode: widget.focusNode,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          InkWell(
            onTap: widget.onCartTap,
            child: const HomeCartComponent(),
          ),
        ],
      ),
    );
  }
}
