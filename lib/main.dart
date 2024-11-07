import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/logging/app_logger.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/service/bloc_observer_service.dart';
import 'package:major_craft_application/service/connectivity_checker.dart';
import 'package:major_craft_application/service/navigation_logger.dart';
import 'package:major_craft_application/service/navigation_service.dart';

void main() async {
  await startApp();
}

Future<void> startApp() async {
  // BindingBase.debugZoneErrorsAreFatal = true;
  await DependencyInjection.registerDependecies();
  // Bloc Observer
  Bloc.observer = BlocObserverService();
  // Load Intl
  await Lang.load(const Locale('vi', 'VN'));
  // App Logger
  final appLogger = DependencyInjection.instance<AppLogger>();

  await runZonedGuarded(
    () async => {
      WidgetsFlutterBinding.ensureInitialized(),
      // Native Splash Start
      FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance),
      await Future<void>.delayed(const Duration(seconds: 3)),
      // Screen Ultil
      await ScreenUtil.ensureScreenSize(),
      //Check Connectivity
      await DependencyInjection.instance<ConnectivityChecker>().initialize(),
      runApp(const MajorCraftApp()),
    },
    (ex, st) => appLogger.severe('Unhandled error', ex, st),
  );
  // Remove Native Splash
  FlutterNativeSplash.remove();
}

class MajorCraftApp extends StatefulWidget {
  const MajorCraftApp({super.key});

  @override
  State<MajorCraftApp> createState() => _MajorCraftAppState();
}

class _MajorCraftAppState extends State<MajorCraftApp> {
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          builder: FToastBuilder(),
          localizationsDelegates: const [
            Lang.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('en', 'US'),
          supportedLocales: Lang.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerDelegate: AutoRouterDelegate(
            DependencyInjection.instance<NavigationService>(),
            navigatorObservers: () => [
              DependencyInjection.instance<NavigationLogger>(),
            ],
          ),
          routeInformationParser: DependencyInjection.instance<NavigationService>().defaultRouteParser(),
        );
      },
    );
  }
}
