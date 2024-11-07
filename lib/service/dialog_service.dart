import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:major_craft_application/core/constants/widget_keys.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/dependency_injection.dart';

abstract class DialogService {
  Future<void> alert(String message, {String? title, String? ok});

  Future<ConfirmDialogResponse> confirm(String message, {String? title, String? ok, String? cancel});

  Future<T?> showBottomSheet<T extends Object>(String bottomSheetName, {Object? parameter});

  Future<bool> dismiss([Object? result]);

  Future<void> showLoading([String? message]);

  void showSnackbar(String message, {Duration duration = const Duration(seconds: 2)});

  Future<T?> show<T extends Object?>(String dialogName, {Object? parameter, bool dismissable = true});

  Future<void> showNoInternet();
}

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  bool _isLoadingShown = false;
  bool _isDialogShown = false;

  static BuildContext get _context {
    final context = WidgetKeys.navigatorKey.currentState?.overlay?.context;

    if (context == null) {
      throw StateError('BuildContext is null');
    }

    return context;
  }

  @override
  Future<void> alert(String message, {String? title, String? ok}) async {
    _isDialogShown = true;
    await showDialog<void>(
      context: _context,
      routeSettings: const RouteSettings(name: '/dialogs/alert'),
      builder: (context) {
        return _AlertDialog(
          message: message,
          title: title,
          ok: ok ?? Lang.of(context).generalOk,
        );
      },
    );

    _isDialogShown = false;
  }

  @override
  Future<ConfirmDialogResponse> confirm(
    String message, {
    String? title,
    String? ok,
    String? cancel,
  }) async {
    final confirmed = await showDialog<bool?>(
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: '/dialogs/confirm'),
      context: _context,
      builder: (context) {
        return _AlertDialog(
          message: message,
          title: title,
          ok: ok ?? Lang.of(context).generalOk,
          cancel: cancel ?? Lang.of(context).generalCancel,
        );
      },
    );

    _isDialogShown = false;

    if (confirmed == true) {
      return ConfirmDialogResponse.confirmed;
    } else if (confirmed == false) {
      return ConfirmDialogResponse.dismissed;
    }

    return ConfirmDialogResponse.cancelled;
  }

  @override
  Future<T?> showBottomSheet<T extends Object>(String bottomSheetName, {Object? parameter}) async {
    final settings = RouteSettings(name: '/bottom-sheets/$bottomSheetName', arguments: parameter);
    final result = showModalBottomSheet<T>(
      context: _context,
      routeSettings: settings,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: _getView(bottomSheetName),
        );
      },
    );

    _isDialogShown = false;

    return result;
  }

  @override
  Future<void> showLoading([String? message]) async {
    if (_isLoadingShown) {
      return;
    }

    _isDialogShown = true;
    _isLoadingShown = true;

    unawaited(
      Future<void>(
        () async {
          await showDialog<void>(
            context: _context,
            barrierDismissible: false,
            routeSettings: const RouteSettings(name: '/dialogs/loading'),
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(message ?? Lang.of(_context).dialogLoading),
                  ],
                ),
              );
            },
          );

          _isDialogShown = false;
          _isLoadingShown = false;
        },
      ),
    );
  }

  @override
  Future<bool> dismiss([Object? result]) async {
    if (_isDialogShown || _isLoadingShown) {
      return AutoRouter.of(_context).pop(result);
    }

    return false;
  }

  @override
  void showSnackbar(String message, {Duration duration = const Duration(seconds: 2)}) {
    final mediaQuery = MediaQuery.of(_context);
    final isLargeDevice = mediaQuery.size.width > 512;
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        width: isLargeDevice ? 512 : null,
        duration: duration,
      ),
    );
  }

  @override
  Future<T?> show<T>(String dialogName, {Object? parameter, bool dismissable = true}) async {
    _isDialogShown = true;
    final settings = RouteSettings(name: '/dialogs/$dialogName', arguments: parameter);
    final result = await showDialog<T>(
      context: _context,
      routeSettings: settings,
      barrierDismissible: dismissable,
      builder: (context) => _getView(dialogName),
    );

    _isDialogShown = false;

    return result;
  }

  @override
  Future<void> showNoInternet() {
    return alert(
      Lang.current.dialogConnectionProblemMessage,
      title: Lang.current.dialogConnectionProblemTitle,
    );
  }

  static Widget _getView(String name) {
    final viewUri = Uri.parse(name);
    final viewPath = viewUri.path;

    if (DependencyInjection.instance.isRegistered<Widget>(instanceName: viewPath)) {
      return DependencyInjection.instance<Widget>(instanceName: viewPath);
    }

    throw UnsupportedError('view $viewPath not registered in GetIt');
  }
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    required this.message,
    required this.ok,
    this.title,
    this.cancel,
  });

  final String message;
  final String ok;
  final String? title;
  final String? cancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          : null,
      content: Text(message),
      actions: <Widget>[
        if (cancel != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancel!),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(ok),
        ),
      ],
    );
  }
}
