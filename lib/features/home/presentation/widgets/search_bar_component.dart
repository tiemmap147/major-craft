import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/features/home/presentation/widgets/home_cart_component.dart';
import 'package:major_craft_application/features/home/presentation/widgets/search_bar_home.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({
    super.key,
    required this.searchEditingController,
    required this.focusNode,
    required this.searchBarType,
    this.onArrowBackTap,
    this.onFilterTap,
    this.onTextFieldSubmit,
    this.onTextFieldChange,
    this.onCartTap,
  });

  final TextEditingController searchEditingController;
  final FocusNode focusNode;
  final int searchBarType;
  final VoidCallback? onArrowBackTap;
  final VoidCallback? onFilterTap;
  final Function(String)? onTextFieldSubmit;
  final Function(String)? onTextFieldChange;
  final VoidCallback? onCartTap;

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.w),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: AppSizes.currentScreenWidth,
      color: AppColors.primary500,
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.searchBarType == SearchBarType.home.index)
              Expanded(
                child: InkWell(
                  onTap: () => {
                    context.router.push(const HomeSearchRoute()),
                  },
                  child: AbsorbPointer(
                    child: SearchBarHome(
                      textEditingController: widget.searchEditingController,
                      focusNode: widget.focusNode,
                      searchBarType: widget.searchBarType,
                      onArrowBackTap: widget.onArrowBackTap,
                      onCartTap: widget.onCartTap,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: SearchBarHome(
                  textEditingController: widget.searchEditingController,
                  focusNode: widget.focusNode,
                  searchBarType: widget.searchBarType,
                  onArrowBackTap: widget.onArrowBackTap,
                  onFilterTap: widget.onFilterTap,
                  onTextFieldSubmit: widget.onTextFieldSubmit,
                  onTextFieldChange: widget.onTextFieldChange,
                  onCartTap: widget.onCartTap,
                ),
              ),
            if (widget.searchBarType == SearchBarType.home.index)
              Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  InkWell(
                    onTap: widget.onCartTap,
                    // inkWellFeedBackFor: InkWellFeedBackFor.icon.index,
                    child: const HomeCartComponent(),
                  ),
                ],
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
