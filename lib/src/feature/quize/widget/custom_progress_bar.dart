import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    required this.duration, required this.color, required this.value, required this.height, required this.radius, required this.padding, super.key,
  }) : assert(value >= 0 && value <= 100, "Value must be between 0 and 100");

  final int duration;
  final Color color;
  final num value;
  final double height;
  final double radius;
  final double padding;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final x = constraints.maxWidth;
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: duration),
                width: x,
                height: height + (padding * 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: duration),
                padding: EdgeInsets.symmetric(horizontal: padding),
                width: (value / 100) * x,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ],
          );
        },
      );
}
