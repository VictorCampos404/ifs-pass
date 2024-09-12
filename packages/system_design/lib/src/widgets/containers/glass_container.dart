import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final Duration? duration;
  final Curve? curve;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  const GlassContainer({
    this.child,
    this.radius,
    this.width,
    this.height,
    this.duration,
    this.curve,
    this.margin,
    this.padding,
    this.constraints,
    this.alignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: duration ?? Duration.zero,
            curve: curve ?? Curves.linear,
            constraints: constraints,
            padding: padding,
            width: width,
            height: height,
            alignment: alignment,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.1),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  radius ?? 0,
                ),
              ),
              border: Border.all(
                color: Colors.grey.shade200.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
