import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MoniepointColor.whiteBG,
            MoniepointColor.whiteBG,
            MoniepointColor.primaryContainerLightColor,
            MoniepointColor.primaryContainerColor,
            MoniepointColor.primaryContainerColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
