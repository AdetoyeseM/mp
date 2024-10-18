import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; 
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/ripple_painter.dart';

class RippleTapWidget extends StatelessWidget {
  const RippleTapWidget({
    super.key,
    required this.onPressed,
    this.hideBorder = false,
    required this.child,
    this.enableRipple = false,
    required this.index,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.borderThickness,
    required this.animation,
  });

  final VoidCallback onPressed;
  final bool hideBorder;
  final Widget child;
  final bool enableRipple;
  final int index;
  final double? width;
  final double? height;
  final double? borderThickness;

  final EdgeInsets? padding;
  final Decoration? decoration;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      containedInkWell: true,
      highlightShape: BoxShape.circle,
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: 300.ms,
        padding: padding ?? const EdgeInsets.all(12),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: decoration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            enableRipple
                ? AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return hideBorder
                          ? const SizedBox.shrink()
                          : Center(
                              child: CustomPaint(
                                painter: RipplePainter(animation.value,
                                    strokeWidth: borderThickness),
                              ),
                            );
                    },
                  )
                : const SizedBox.shrink(),
            child,
          ],
        ),
      ),
    );
  }
}
