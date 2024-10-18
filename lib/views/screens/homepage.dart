import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/name_header.dart';
import '../reusable_widgets/widgets/bottom_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ValueNotifier<int> buyValue = ValueNotifier<int>(0);
  final ValueNotifier<int> rentValue = ValueNotifier<int>(0);
  final ValueNotifier<bool> expandText = ValueNotifier<bool>(false);
  final ValueNotifier<bool> hideCircleRowValue = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    Future.wait([
      Future.delayed(const Duration(milliseconds: 1800), () {
        buyValue.value = 1034;
        rentValue.value = 2212;
      }),
      Future.delayed(const Duration(milliseconds: 1200), () {
        expandText.value = true;
      }),
      Future.delayed(const Duration(milliseconds: 2600), () {
        hideCircleRowValue.value = true;
      }),
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: expandText,
              builder: (context, expandTextValue, _) {
                return ValueListenableBuilder<bool>(
                  valueListenable: hideCircleRowValue,
                  builder: (context, hideCircleRowValue, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: NameHeader(
                        expandText: expandTextValue,
                        hideCircleRow: hideCircleRowValue,
                      ),
                    );
                  },
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: buyValue,
              builder: (context, a, _) {
                return ValueListenableBuilder<int>(
                  valueListenable: rentValue,
                  builder: (context, b, _) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: hideCircleRowValue,
                      builder: (context, hideCircleRowValue, _) {
                        return BottomSection(
                          numValue1: a,
                          numValue2: b,
                          hideCircleRow: hideCircleRowValue,
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight * 2,
            ),
          ],
        ),
      ),
    );
  }
}
