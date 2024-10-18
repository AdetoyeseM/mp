import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/slider_button.dart';
 

class BottomSheetImageWidget extends StatelessWidget {
  const BottomSheetImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeWidth(1),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const GridImageContainer(
            displayText: 'Gladkova St., 25',
          ),
          SizedBox(
            height: context.sizeHeight(0.4),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GridImageContainer(
                      imagePath: "interior_4",
                      imageHeight: context.sizeHeight(0.5),
                      animationDurationMs: 3600,
                      displayText: 'Malaga St., 92',
                      sliderWidthPercentage: 0.36,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => Expanded(
                          child: GridImageContainer(
                            imagePath: index.isEven
                                ? "interior_3"
                                : "interior_2",
                            imageHeight: context.sizeHeight(0.4),
                            animationDurationMs: 3650,
                            displayText:
                                index == 0 ? 'Margaret., 32' : 'Trefeleva., 43',
                            sliderWidthPercentage: 0.36,
                          ),
                        ),
                      ).columnInPadding(5),
                    ),
                  )
                ].rowInPadding(5)),
          ).padSymmetric(vertical: 5),
        ],
      ),
    );
  }
}
