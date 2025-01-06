import 'dart:ui';

import 'package:flutter/material.dart';

class BlurOverlayRoute<T> extends ModalRoute<T> {
  final double? blur;

  BlurOverlayRoute({super.settings, this.blur});

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get barrierDismissible => true;

  @override
  bool get opaque => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      Material(
        type: MaterialType.canvas,
        color: Colors.transparent,
        child: PopScope(
          canPop: true,
          child: GestureDetector(
            onTap: pop,
            child: Container(color: Colors.transparent),
          ),
        ),
      );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: animation.value * (blur ?? 10),
          sigmaY: animation.value * (blur ?? 10),
        ),
        child: child,
      );

  void pop() {
    navigator?.pop();
  }
}
