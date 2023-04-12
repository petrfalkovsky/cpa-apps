import 'package:flutter/material.dart';
import 'package:cleaning/config/config.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  Color get barrierColor => AppConfig.whiteColor;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}
