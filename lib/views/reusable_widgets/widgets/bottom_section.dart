import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/bottom_sheet.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/stat_display_card.dart'; 
class BottomSection extends StatelessWidget {
  const BottomSection(
      {super.key, required this.numValue1, required this.numValue2, required this.hideCircleRow});
  final int numValue1;
  final int numValue2;
  final bool hideCircleRow;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: StatsDisplayCard(
                  label: 'BUY',
                  isCircle: true,
                  counterValue: numValue1,
                ),
              ).scale(delay: 1800.ms, animationDuration: 1000.ms),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: StatsDisplayCard(
                  label: 'RENT',
                  counterValue: numValue2,
                ),
              ).scale(delay: 1800.ms, animationDuration: 1000.ms),
            )
          ],
        ),

        
        Offstage(
          offstage: !hideCircleRow,
          child: const BottomSheetImageWidget().slideInFromBottom(
            delay: 2700.ms,
            animationDuration: 1200.ms,
            begin: 1,
          ),
        ),
        
      ].columnInPadding(15),

    );
  }
}
