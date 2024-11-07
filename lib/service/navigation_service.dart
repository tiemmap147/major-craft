import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/constants/widget_keys.dart';
import 'package:major_craft_application/core/utils/page_transition_utils.dart';
import 'package:major_craft_application/features/account/presentation/pages/account_edit_page.dart';
import 'package:major_craft_application/features/account/presentation/pages/account_language_change.dart';
import 'package:major_craft_application/features/account/presentation/pages/account_page.dart';
import 'package:major_craft_application/features/blog/presentation/pages/blog_detail_page.dart';
import 'package:major_craft_application/features/blog/presentation/pages/blog_page.dart';
import 'package:major_craft_application/features/cart/presentation/pages/cart_page.dart';
import 'package:major_craft_application/features/categories/presentation/pages/categories_page.dart';
import 'package:major_craft_application/features/history_transaction/presentation/pages/history_transaction.dart';
import 'package:major_craft_application/features/home/presentation/pages/home_page.dart';
import 'package:major_craft_application/features/home/presentation/pages/home_search_page.dart';
import 'package:major_craft_application/features/home/presentation/pages/home_search_result_page.dart';
import 'package:major_craft_application/features/init/presentation/pages/init_page.dart';
import 'package:major_craft_application/features/login/presentation/pages/login_page.dart';
import 'package:major_craft_application/features/my_address/presentation/pages/my_address.dart';
import 'package:major_craft_application/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:major_craft_application/features/product_detail/presentation/pages/product_detail_page.dart';
import 'package:major_craft_application/features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:major_craft_application/features/shipping/presentation/pages/shipping_page.dart';

part 'navigation_service.gr.dart';

abstract class NavigationService implements RootStackRouter {}

@LazySingleton(as: NavigationService)
@AutoRouterConfig()
class NavigationServiceImpl extends _$NavigationServiceImpl implements NavigationService {
  NavigationServiceImpl() : super(navigatorKey: WidgetKeys.navigatorKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NumberTriviaRoute.page,
          // initial: true,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: LoginRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: InitRoute.page,
          initial: true,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
          children: [
            AutoRoute(
              page: HomeRoute.page,
              type: const RouteType.custom(
                transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
              ),
              children: [
                AutoRoute(
                  page: CartRoute.page,
                  type: const RouteType.custom(
                    transitionsBuilder: PageTransitionUtils.fadedTransitionBuilder,
                  ),
                ),
              ],
            ),
            AutoRoute(
              page: BlogRoute.page,
              type: const RouteType.custom(
                transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
              ),
            ),
            AutoRoute(
              page: CategoriesRoute.page,
              type: const RouteType.custom(
                transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
              ),
            ),
            AutoRoute(
              page: AccountRoute.page,
              type: const RouteType.custom(
                transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
              ),
            ),
          ],
        ),
        AutoRoute(
          page: AccountEditProfileRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: HomeSearchRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.fadedTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: HomeSearchResultRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: ShippingRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: BlogDetailRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: MyAddressRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: HistoryTransactionRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: ProductDetailRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
        AutoRoute(
          page: AccountLanguageChangeRoute.page,
          type: const RouteType.custom(
            transitionsBuilder: PageTransitionUtils.rightToLeftTransitionBuilder,
          ),
        ),
      ];

  @override
  Future<T?> replace<T extends Object?>(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    unawaited(super.replace(route, onFailure: onFailure));

    return Future.value();
  }
}
