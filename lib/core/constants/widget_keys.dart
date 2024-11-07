import 'package:flutter/widgets.dart';

abstract class WidgetKeys {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> categoriesNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> blogNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> accountNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> cartNavigatorKey = GlobalKey();
  static final GlobalKey keyDescription = GlobalKey();
}
