import 'dart:ui';

import 'package:flutter/material.dart';

class LayoutWithBlurOverlay extends StatefulWidget {
  final Scaffold scaffold;
  final ValueNotifier<bool> blurNotifier;

  const LayoutWithBlurOverlay(
      {super.key, required this.scaffold, required this.blurNotifier});

  @override
  State<LayoutWithBlurOverlay> createState() => _LayoutWithBlurOverlayState();
}

class _LayoutWithBlurOverlayState extends State<LayoutWithBlurOverlay> {
  bool _isBlurred = false;

  @override
  void initState() {
    super.initState();
    widget.blurNotifier.addListener(_onBlurChanged);
  }

  @override
  void dispose() {
    widget.blurNotifier.removeListener(_onBlurChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LayoutWithBlurOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.blurNotifier != oldWidget.blurNotifier) {
      oldWidget.blurNotifier.removeListener(_onBlurChanged);
      widget.blurNotifier.addListener(_onBlurChanged);
    }
  }

  void _onBlurChanged() {
    setState(() {
      _isBlurred = widget.blurNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          widget.scaffold,
          if (_isBlurred)
            IgnorePointer(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
        ],
      );
}
