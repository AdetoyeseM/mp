import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/text_decoration.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class StatsDisplayCard extends StatelessWidget {
  const StatsDisplayCard(
      {super.key,
      required this.label,
      this.isCircle = false,
      required this.counterValue});

  final String label;
  final bool isCircle;
  final int counterValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: isCircle ? context.colorScheme.surface : null,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 1.25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IncrementalCounter(
                finalValue: counterValue,
                textStyle: AppStyles.offersCountStyle.copyWith(
                  fontSize: 44,
                  color: isCircle
                      ? MoniepointColor.whiteColor
                      : MoniepointColor.blackColor,
                ),
              ),
              Text(
                'offers',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: isCircle ? context.colorScheme.surface : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IncrementalCounter extends StatelessWidget {
  final int finalValue;
  final Duration animDuration;
  final TextStyle? textStyle;

  const IncrementalCounter(
      {super.key,
      required this.finalValue,
      this.animDuration = const Duration(milliseconds: 1200),
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: finalValue),
      duration: animDuration,
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: textStyle,
        );
      },
    );
  }
}
