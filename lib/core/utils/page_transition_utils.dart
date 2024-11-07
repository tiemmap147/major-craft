// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// abstract class PageTransitionUtils {
//   static Route rightToLeft(Widget page) {
//     return PageTransition(
//       type: PageTransitionType.rightToLeft,
//       child: page,
//       duration: const Duration(milliseconds: 300),
//       reverseDuration: const Duration(milliseconds: 300),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class PageTransitionUtils {
  static Widget rightToLeftTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return PageTransition(
      type: PageTransitionType.rightToLeft,
      child: child,
      curve: Curves.easeOut,
    ).buildTransitions(context, animation, secondaryAnimation, child);
  }

  static Widget fadedTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return PageTransition(
      type: PageTransitionType.fade,
      child: child,
      curve: Curves.easeOut,
    ).buildTransitions(context, animation, secondaryAnimation, child);
  }
}
