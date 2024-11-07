import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/widgets/base/safe_set_state.dart';
import 'package:major_craft_application/theme/app_colors.dart';

class ScaffoldCommon extends StatefulWidget {
  const ScaffoldCommon({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.statusBarColor,
    this.hasAppBar = false,
    this.title,
    this.leading,
  }) : super(key: key);

  final Widget body;
  final Color? statusBarColor;
  final Widget? bottomNavigationBar;
  final bool hasAppBar;
  final Widget? title;
  final Widget? leading;
  @override
  State<ScaffoldCommon> createState() => _ScaffoldCommonState();
}

class _ScaffoldCommonState extends SafeState<ScaffoldCommon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hasAppBar
          ? AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
              ),
              backgroundColor: AppColors.primary500,
              title: widget.title,
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: widget.leading,
              leadingWidth: 32.w,
            )
          : AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
              ),
              backgroundColor: AppColors.primary500,
              automaticallyImplyLeading: false,
              toolbarHeight: 0,
            ),
      backgroundColor: AppColors.neutral100,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
