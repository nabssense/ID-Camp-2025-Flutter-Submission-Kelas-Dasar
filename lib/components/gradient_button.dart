import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.gradient,
    this.radius = 999,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.border,
    this.boxShadow,
  }) ;


  final VoidCallback? onPressed;
  final Widget child;
  final Gradient gradient;
  final double radius;
  final EdgeInsetsGeometry padding;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          border: border,
          boxShadow: boxShadow,
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(radius),
          child: Padding(
            padding: padding,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}