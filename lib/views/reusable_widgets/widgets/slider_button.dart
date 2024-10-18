import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/text_decoration.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/moniepoint_icon.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class GridImageContainer extends StatefulWidget {
  const GridImageContainer({
    super.key,
    this.animationDurationMs = 2800,
    required this.displayText,
    this.imageHeight,
    this.imagePath,
    this.sliderWidthPercentage,
  });

  final String displayText;
  final int animationDurationMs;
  final String? imagePath;
  final double? imageHeight;
  final double? sliderWidthPercentage;

  @override
  GridImageContainerState createState() => GridImageContainerState();
}

class GridImageContainerState extends State<GridImageContainer> {
  late ValueNotifier<bool> isSliderTransformed;
  late ValueNotifier<bool> isTextHidden;
  late ValueNotifier<int> animationDurationNotifier;

  @override
  void initState() {
    super.initState();
    isSliderTransformed = ValueNotifier<bool>(false);
    isTextHidden = ValueNotifier<bool>(true);
    animationDurationNotifier = ValueNotifier<int>(widget.animationDurationMs);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: animationDurationNotifier.value),
          () {
        isSliderTransformed.value = true;
      });
    });
  }

  @override
  void dispose() {
    isSliderTransformed.dispose();
    isTextHidden.dispose();
    animationDurationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MoniepointIcons(
              fit: BoxFit.cover,
              imageType: ImageType.png,
              height: widget.imageHeight ?? context.sizeHeight(0.2),
              width: context.sizeWidth(1),
              png: widget.imagePath ?? "interior_1",
            )),
        Positioned(
          bottom: 10,
          left: context.sizeWidth(0.05),
          child: ValueListenableBuilder<bool>(
            valueListenable: isSliderTransformed,
            builder: (context, isTransformedValue, child) {
              return AnimatedContainer(
                width: isTransformedValue
                    ? context.sizeWidth(widget.sliderWidthPercentage ?? 0.8)
                    : 45,
                height: 42,
                onEnd: () {
                  isTextHidden.value = false;
                },
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withOpacity(0.8),
                  borderRadius:
                      BorderRadius.circular(isTransformedValue ? 100 : 10),
                ),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.linear,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isTextHidden,
                        builder: (context, isHiddenValue, child) {
                          return isHiddenValue
                              ? const SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Text(
                                  widget.displayText,
                                  style: AppStyles.offersCountStyle.copyWith(
                                    fontSize: 12,
                                    color: MoniepointColor.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ).fadeInFromLeft(
                                  delay: 100.ms, animationDuration: 100.ms);
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 38,
                        margin:
                            isTransformedValue ? const EdgeInsets.all(2) : null,
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: context.colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
