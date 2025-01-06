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
  Duration get transitionDuration => const Duration(milliseconds: 200);

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
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.1, end: blur ?? 10),
              duration: Duration(milliseconds: 300),
              builder: (context, double? val, Widget? child) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: val ?? 0,
                    sigmaY: val ?? 0,
                  ),
                  child: Container(color: Colors.transparent),
                );
              },
            ),
          ),
        ),
      );

  void pop() {
    navigator?.pop();
  }
}
