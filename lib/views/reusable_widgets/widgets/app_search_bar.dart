import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/moniepoint_icon.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/cutom_textfield.dart'; 

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.sizeHeight(0.06),
      left: 30,
      height: 80,
      width: MediaQuery.sizeOf(context).width * (0.85),
      child: Row(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: const CustomTextField()
            ).scale(animationDuration: 1200.ms, delay: 200.ms),
          ),
               const SizedBox(
          width: 10,
        ),
          CircleAvatar(
            backgroundColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onSurface,
            child: const MoniepointIcons(imageType: ImageType.svg,svg: "filter",
              height: 18,
            ),
          ).scale(animationDuration: 1210.ms, delay: 200.ms),
        ]
      ),
    );
  }
}
