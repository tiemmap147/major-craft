// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation_service.dart';

abstract class _$NavigationServiceImpl extends RootStackRouter {
  // ignore: unused_element
  _$NavigationServiceImpl({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountEditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountEditProfilePage(),
      );
    },
    AccountLanguageChangeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountLanguageChangePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    BlogDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogDetailPage(),
      );
    },
    BlogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogPage(),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesPage(),
      );
    },
    HistoryTransactionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryTransactionPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HomeSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeSearchPage(),
      );
    },
    HomeSearchResultRoute.name: (routeData) {
      final args = routeData.argsAs<HomeSearchResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeSearchResultPage(
          key: args.key,
          searchText: args.searchText,
        ),
      );
    },
    InitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MyAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAddressPage(),
      );
    },
    NumberTriviaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NumberTriviaPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailPage(
          key: args.key,
          description: args.description,
          imageName: args.imageName,
          categoryItem: args.categoryItem,
          price: args.price,
          discount: args.discount,
          quantityBought: args.quantityBought,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordPage(),
      );
    },
    ShippingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShippingPage(),
      );
    },
  };
}

/// generated route for
/// [AccountEditProfilePage]
class AccountEditProfileRoute extends PageRouteInfo<void> {
  const AccountEditProfileRoute({List<PageRouteInfo>? children})
      : super(
          AccountEditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountEditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountLanguageChangePage]
class AccountLanguageChangeRoute extends PageRouteInfo<void> {
  const AccountLanguageChangeRoute({List<PageRouteInfo>? children})
      : super(
          AccountLanguageChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountLanguageChangeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogDetailPage]
class BlogDetailRoute extends PageRouteInfo<void> {
  const BlogDetailRoute({List<PageRouteInfo>? children})
      : super(
          BlogDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogPage]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryTransactionPage]
class HistoryTransactionRoute extends PageRouteInfo<void> {
  const HistoryTransactionRoute({List<PageRouteInfo>? children})
      : super(
          HistoryTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryTransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeSearchPage]
class HomeSearchRoute extends PageRouteInfo<void> {
  const HomeSearchRoute({List<PageRouteInfo>? children})
      : super(
          HomeSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeSearchResultPage]
class HomeSearchResultRoute extends PageRouteInfo<HomeSearchResultRouteArgs> {
  HomeSearchResultRoute({
    Key? key,
    required String searchText,
    List<PageRouteInfo>? children,
  }) : super(
          HomeSearchResultRoute.name,
          args: HomeSearchResultRouteArgs(
            key: key,
            searchText: searchText,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeSearchResultRoute';

  static const PageInfo<HomeSearchResultRouteArgs> page =
      PageInfo<HomeSearchResultRouteArgs>(name);
}

class HomeSearchResultRouteArgs {
  const HomeSearchResultRouteArgs({
    this.key,
    required this.searchText,
  });

  final Key? key;

  final String searchText;

  @override
  String toString() {
    return 'HomeSearchResultRouteArgs{key: $key, searchText: $searchText}';
  }
}

/// generated route for
/// [InitPage]
class InitRoute extends PageRouteInfo<void> {
  const InitRoute({List<PageRouteInfo>? children})
      : super(
          InitRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAddressPage]
class MyAddressRoute extends PageRouteInfo<void> {
  const MyAddressRoute({List<PageRouteInfo>? children})
      : super(
          MyAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NumberTriviaPage]
class NumberTriviaRoute extends PageRouteInfo<void> {
  const NumberTriviaRoute({List<PageRouteInfo>? children})
      : super(
          NumberTriviaRoute.name,
          initialChildren: children,
        );

  static const String name = 'NumberTriviaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailPage]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required String description,
    required String imageName,
    required String categoryItem,
    required int price,
    required int discount,
    required int quantityBought,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            description: description,
            imageName: imageName,
            categoryItem: categoryItem,
            price: price,
            discount: discount,
            quantityBought: quantityBought,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.description,
    required this.imageName,
    required this.categoryItem,
    required this.price,
    required this.discount,
    required this.quantityBought,
  });

  final Key? key;

  final String description;

  final String imageName;

  final String categoryItem;

  final int price;

  final int discount;

  final int quantityBought;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, description: $description, imageName: $imageName, categoryItem: $categoryItem, price: $price, discount: $discount, quantityBought: $quantityBought}';
  }
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShippingPage]
class ShippingRoute extends PageRouteInfo<void> {
  const ShippingRoute({List<PageRouteInfo>? children})
      : super(
          ShippingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShippingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
