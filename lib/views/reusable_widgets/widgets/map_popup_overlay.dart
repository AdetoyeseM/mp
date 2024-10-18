import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/moniepoint_icon.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/ripple_tap_effect.dart';

class PopupOverlay extends StatefulWidget {
  const PopupOverlay({super.key, required this.animController});
  final AnimationController animController;

  @override
  State<PopupOverlay> createState() => _PopupOverlayState();
}

class _PopupOverlayState extends State<PopupOverlay>
    with TickerProviderStateMixin {
  final OverlayPortalController _firstOverlayController =
      OverlayPortalController();
  final OverlayPortalController _secondOverlayController =
      OverlayPortalController();

  late AnimationController _tapAnimController;
  late Animation<double> _tapRippleAnim;

  final ValueNotifier<int> selectedIcon = ValueNotifier<int>(0);
  final ValueNotifier<bool> borderVisibility = ValueNotifier<bool>(false);

  late Animation<double> _popupScaleAnim;
  late double _initialScale, _finalScale;
  List<String> overlayItems = [];

  @override
  void initState() {
    _initialScale = 20;
    _finalScale = 15;

    _tapAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _popupScaleAnim =
        CurvedAnimation(parent: widget.animController, curve: Curves.linear);

    _tapRippleAnim = Tween<double>(
      begin: _initialScale,
      end: _finalScale,
    ).animate(
      CurvedAnimation(
        parent: _tapAnimController,
        curve: Curves.easeOut,
      ),
    );

    _tapAnimController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _removeBorder();
        _tapAnimController.reset();
      }
    });

    super.initState();
    overlayItems = [
      'Cosy areas',
      'Price',
      'Infrastructure',
      'Without any layer'
    ];
  }

  @override
  void dispose() {
    _tapAnimController.dispose();
    selectedIcon.dispose();
    borderVisibility.dispose();
    super.dispose();
  }

  void _removeBorder() {
    borderVisibility.value = false;
  }

  void _showBorder() {
    borderVisibility.value = true;
  }

  void _handleTap() {
    _showBorder();
    _tapAnimController.forward();
    widget.animController.forward();
    _firstOverlayController.show();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _popupScaleAnim,
      builder: (context, child) {
        return Column(
          children: [
            ...List.generate(
              2,
              (index) => OverlayPortal(
                controller: [
                  _firstOverlayController,
                  _secondOverlayController
                ][index],
                overlayChildBuilder: (context) {
                  return Positioned(
                    bottom: context.sizeHeight(0.175),
                    left: 30,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform.scale(
                        scale: _popupScaleAnim.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 14, top: 14, right: 10),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              4,
                              (itemIndex) => Row(
                                children: [
                                  MoniepointIcons(
                                    imageType: ImageType.svg,
                                    svg: [
                                      "wallet",
                                      "trash",
                                      "layers",
                                      "shield"
                                    ][itemIndex],
                                    height: 20,
                                    color: itemIndex == 1
                                        ? context.colorScheme.primary
                                        : context.colorScheme.secondary,
                                  ),
                                  Text(
                                    overlayItems[itemIndex],
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: itemIndex == 1
                                          ? context.colorScheme.primary
                                          : context.colorScheme.secondary,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ].rowInPadding(10),
                              ).onTapWidget(
                                onTap: () {
                                  widget.animController.reverse();
                                }, 
                              ),
                            ).columnInPadding(15),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: borderVisibility,
                  builder: (context, borderVisible, child) {
                    return ValueListenableBuilder<int>(
                      valueListenable: selectedIcon,
                      builder: (context, currentIcon, child) {
                        return RippleTapWidget(
                          index: index,
                          enableRipple: currentIcon == index,
                          hideBorder: borderVisible,
                          borderThickness: 3,
                          onPressed: () {
                            _handleTap();
                            selectedIcon.value = index;
                          },
                          height: 45,
                          width: 45,
                          padding: const EdgeInsets.all(14),
                          animation: _tapRippleAnim,
                          decoration: BoxDecoration(
                            color:
                                context.colorScheme.tertiary.withOpacity(0.6),
                            shape: BoxShape.circle,
                            border: !borderVisible
                                ? null
                                : Border.all(
                                    color: context.colorScheme.surface
                                        .withOpacity(0.8),
                                    width: 1,
                                  ),
                          ),
                          child: Transform.rotate(
                            angle: index == 0 ? 0 : 1.0,
                            child: MoniepointIcons(
                              imageType: ImageType.svg,
                              svg: index == 0 ? "layers" : "map-arrow",
                              color:
                                  context.colorScheme.surface.withOpacity(0.8),
                              height: 17,
                              width: 20,
                            ),
                          ),
                        ).scale(animationDuration: 1500.ms, delay: 200.ms);
                      },
                    );
                  },
                ),
              ),
            ).columnInPadding(5),
          ],
        );
      },
    );
  }
}
