import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

class SearchBarProductDetail extends StatefulWidget {
  const SearchBarProductDetail({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    this.searchBarType = 0,
    this.onFilterTap,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final int searchBarType;
  final VoidCallback? onFilterTap;

  @override
  State<SearchBarProductDetail> createState() => _SearchBarProductDetailState();
}

class _SearchBarProductDetailState extends State<SearchBarProductDetail> {
  @override
  Widget build(BuildContext context) {
    return SearchBarSearchHomeComponent(widget: widget);
  }
}

class SearchBarSearchHomeComponent extends StatelessWidget {
  const SearchBarSearchHomeComponent({
    super.key,
    required this.widget,
  });

  final SearchBarProductDetail widget;

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
