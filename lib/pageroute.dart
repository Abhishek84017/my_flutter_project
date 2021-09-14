import 'package:flutter/material.dart';

class RotationRoute<T> extends PageRoute<T> {
  final Widget? Page;

  RotationRoute({this.Page});

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    animation = CurvedAnimation(
        parent: animation,
        curve: Curves.linearToEaseOut,
        reverseCurve: Curves.easeInToLinear);
    return SlideTransition(
        transformHitTests: false,
        position:
        animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset.zero)),
        child: Page);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);
}
