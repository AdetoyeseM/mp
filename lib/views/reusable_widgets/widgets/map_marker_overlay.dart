import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';

class MapMarkerOverlay extends StatefulWidget {
  const MapMarkerOverlay({super.key, required this.isVisible});

  final bool isVisible;

  @override
  State<MapMarkerOverlay> createState() => _MapMarkerOverlayState();
}

class _MapMarkerOverlayState extends State<MapMarkerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: 1200.ms);
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    bool markersVisible = widget.isVisible;
    return Stack(
      children: [
        ...List.generate(
          6,
          (index) => Positioned(
            top: MediaQuery.sizeOf(context).height *
                ([0.23, 0.295, 0.5, 0.32, 0.45, 0.55][index]),
            left: MediaQuery.sizeOf(context).width *
                ([0.3, 0.35, 0.2, 0.7, 0.7, 0.6][index]),
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    alignment: Alignment.bottomLeft,
                    child: AnimatedContainer(
                      duration: 800.ms,
                      width: !markersVisible ? 35 : 75,
                      padding: EdgeInsets.symmetric(
                          horizontal: !markersVisible ? 8 : 12, vertical: 12),
                      decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )),
                      child: !markersVisible
                          ? Icon(
                              Icons.apartment_rounded,
                              color: context.colorScheme.surface,
                              size: 20,
                            )
                          : Text(
                              [
                                '11M ₽',
                                '8.5M ₽',
                                '10.3M ₽',
                                '13.3M ₽',
                                '13.3M ₽',
                                '7.8M ₽',
                              ][index],
                              style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 10,
                                color: context.colorScheme.surface,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
