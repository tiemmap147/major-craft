import 'dart:io';

// import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

abstract class ValidateUtils {
  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final RegExp _onlyCharRegExp = RegExp(r"^[\p{L} ,.'-]+$", unicode: true);

  static bool validateEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool validateName(String name) {
    return _onlyCharRegExp.hasMatch(name);
  }

  static bool validatePassword(String password) {
    return password.length >= 6;
  }

  // static Future<bool> isIpad() async {
  //   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   final IosDeviceInfo info = await deviceInfo.iosInfo;
  //   if (info.model.toLowerCase().contains('ipad')) {
  //     return true;
  //   }
  //   return false;
  // }

  static bool isNotIOS({bool includeMacOS = false}) {
    if (includeMacOS) {
      return Platform.isAndroid || Platform.isLinux || Platform.isWindows;
    }

    return Platform.isAndroid || Platform.isLinux || Platform.isWindows || Platform.isMacOS;
  }

  static bool isDarkMode() {
    return false;
    // return SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;
  }

  // static Future<Position?> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // return Future.error('Location services are disabled.');
  //     return null;
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // return Future.error('Location permissions are denied');
  //       return null;
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // return Future.error(
  //     //     'Location permissions are permanently denied, we cannot request permissions.');
  //     return null;
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  static int timeOfDateToDouble(TimeOfDay myTime) => myTime.hour * 60 + myTime.minute;

  static int compareTimeOfDate(TimeOfDay time1, TimeOfDay time2) =>
      timeOfDateToDouble(time1) - timeOfDateToDouble(time2);
}
