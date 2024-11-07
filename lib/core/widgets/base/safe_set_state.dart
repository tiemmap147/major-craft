import 'package:flutter/material.dart';

abstract class SafeState<T extends StatefulWidget> extends State<T> {
  //only set State when mounted :)
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
