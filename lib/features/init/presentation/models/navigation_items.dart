import 'package:flutter/material.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/features/init/presentation/models/navigation_item_model.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/app_colors.dart';

final List<NavigationItem> navigationItems = [
  NavigationItem(
    label: Lang.current.home,
    iconPath: Assets.icons.bottomNavigationHome.path,
    colorFilter: const ColorFilter.mode(AppColors.neutral700, BlendMode.srcIn),
    activeColorFilter: const ColorFilter.mode(AppColors.primary400, BlendMode.srcIn),
  ),
  NavigationItem(
    label: Lang.current.categories,
    iconPath: Assets.icons.bottomNavigationCategories.path,
    colorFilter: const ColorFilter.mode(AppColors.neutral700, BlendMode.srcIn),
    activeColorFilter: const ColorFilter.mode(AppColors.primary400, BlendMode.srcIn),
  ),
  NavigationItem(
    label: Lang.current.blog,
    iconPath: Assets.icons.bottomNavigationBlog.path,
    colorFilter: const ColorFilter.mode(AppColors.neutral700, BlendMode.srcIn),
    activeColorFilter: const ColorFilter.mode(AppColors.primary400, BlendMode.srcIn),
  ),
  NavigationItem(
    label: Lang.current.account,
    iconPath: Assets.icons.bottomNavigationAccount.path,
    colorFilter: const ColorFilter.mode(AppColors.neutral700, BlendMode.srcIn),
    activeColorFilter: const ColorFilter.mode(AppColors.primary400, BlendMode.srcIn),
  ),
];
