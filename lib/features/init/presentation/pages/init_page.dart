import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/features/init/presentation/models/navigation_items.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        CategoriesRoute(),
        BlogRoute(),
        AccountRoute(),
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);

        return ScaffoldCommon(
          body: child,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              enableFeedback: true,
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) => {
                HapticFeedback.lightImpact(),
                // WidgetKeys.homeNavigatorKey.currentState?.popUntil((route) => route.isFirst),
                tabsRouter.setActiveIndex(value),
              },
              unselectedLabelStyle: AppTextStyle.smallText12Regular(),
              selectedLabelStyle: AppTextStyle.smallText12Medium(),
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.primary400,
              unselectedItemColor: AppColors.neutral700,
              showUnselectedLabels: true,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              type: BottomNavigationBarType.fixed,
              iconSize: 24.h,
              items: [
                getNavigationBarItem(index: 0),
                getNavigationBarItem(index: 1),
                getNavigationBarItem(index: 2),
                getNavigationBarItem(index: 3),
              ],
            ),
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem getNavigationBarItem({required int index}) {
  final item = navigationItems[index];

  return BottomNavigationBarItem(
    label: item.label,
    icon: SvgPicture.asset(
      item.iconPath,
      colorFilter: item.colorFilter,
    ),
    activeIcon: SvgPicture.asset(
      item.iconPath,
      colorFilter: item.activeColorFilter,
    ),
  );
}
