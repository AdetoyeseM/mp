 
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/text_decoration.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/moniepoint_icon.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({
    super.key,
    required this.expandText,
    required this.hideCircleRow,
  });

  final bool expandText;
  final bool hideCircleRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AnimatedSize(
                duration: 800.ms,
                curve: Curves.linear,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: !expandText
                      ? 10
                      : MediaQuery.sizeOf(context).width * (0.47),
                  decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.secondary.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MoniepointIcons(
                        imageType: ImageType.svg,
                        svg: "mapPoint",
                        color: MoniepointColor.secondary,
                        height: 20,
                      ).animate().fadeInFromLeft(
                          delay: 450.ms, animationDuration: 500.ms),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          'Saint Petersburg',
                          style: AppStyles.locationStyle,
                          maxLines: 1,
                        ).animate().fadeInFromLeft(
                            delay: 600.ms, animationDuration: 800.ms),
                      )
                    ],
                  ),
                ),
              ).animate(delay: 2000.ms),
            ),
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage("assets/images/pngs/user.png"),
            ).scale(animationDuration: 900.ms),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi, Marina',
              style: AppStyles.greetingStyle,
            ).animate(delay: 1500.ms)
          .move(
            duration:  300.ms,
            begin: const Offset(-10, 0),
          )
          .fade(duration:  300.ms)
             ,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'let\'s select your',
                  style: AppStyles.titleStyle,
                )
                    .animate(
                      delay: 1800.ms,
                    )
                    .move(
                      duration: 450.ms,
                      begin: const Offset(0, 10),
                    )
                    .fade(duration: 450.ms),
                Text(
                  'perfect place',
                  style: AppStyles.titleStyle,
                )
                    .animate(
                      delay: 2100.ms,
                    )
                    .move(
                      duration: 500.ms,
                      begin: const Offset(0, 10),
                    )
                    .fade(duration: 500.ms),
              ],
            )
          ],
        ),
      ].columnInPadding(hideCircleRow ? 10 : 20),
    );
  }
}
