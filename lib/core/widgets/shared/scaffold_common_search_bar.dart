import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/widgets/base/safe_set_state.dart';
import 'package:major_craft_application/features/home/presentation/widgets/search_bar_component.dart';
import 'package:major_craft_application/theme/app_colors.dart';

class ScaffoldSearchBar extends StatefulWidget {
  const ScaffoldSearchBar({
    Key? key,
    required this.body,
    required this.searchEditingController,
    required this.focusNode,
    this.searchBarType = 0,
    this.onFilterTap,
    this.onTextFieldSubmit,
    this.onTextFieldChange,
    this.onCartTap,
  }) : super(key: key);

  final Widget body;
  final TextEditingController searchEditingController;
  final FocusNode focusNode;
  final int searchBarType;
  final VoidCallback? onFilterTap;

  final Function(String)? onTextFieldSubmit;
  final Function(String)? onTextFieldChange;

  final VoidCallback? onCartTap;
  @override
  State<ScaffoldSearchBar> createState() => _ScaffoldSearchBarState();
}

class _ScaffoldSearchBarState extends SafeState<ScaffoldSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.primary500,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.neutral100,
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: SliverAppBarDelegate(
              maxHeight: 56.h,
              minHeight: 56.h,
              child: SearchBarComponent(
                searchEditingController: widget.searchEditingController,
                focusNode: widget.focusNode,
                searchBarType: widget.searchBarType,
                onArrowBackTap: () => context.router.pop(),
                onFilterTap: widget.onFilterTap,
                onTextFieldSubmit: widget.onTextFieldSubmit,
                onTextFieldChange: widget.onTextFieldChange,
                onCartTap: widget.onCartTap,
              ),
            ),
            pinned: true,
            floating: true,
          ),
          SliverFillRemaining(child: widget.body),
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.maxHeight,
    required this.child,
    required this.minHeight,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
