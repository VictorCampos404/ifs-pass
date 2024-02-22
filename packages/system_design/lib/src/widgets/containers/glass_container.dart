import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final Duration? duration;
  final Curve? curve;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  const GlassContainer({
    this.child,
    this.radius,
    this.duration,
    this.curve,
    this.margin,
    this.padding,
    this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: duration ?? Duration.zero,
            curve: curve ?? Curves.linear,
            constraints: constraints,
            padding: padding,
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
            child: child,
          ),
        ),
      ),
    );
  }
}
