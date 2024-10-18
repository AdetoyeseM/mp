import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/moniepoint_icon.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/ripple_tap_effect.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/background.dart';
import 'package:madetoyese_assessment_mp/views/screens/homepage.dart';
import 'package:madetoyese_assessment_mp/views/screens/map_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;
  
  final ValueNotifier<bool> _onHideBorder = ValueNotifier<bool>(false);
  final ValueNotifier<int> _pageIndex = ValueNotifier<int>(2);

  final List<Widget> _pages = const [
    MapHomeView(),
    SizedBox(),
    HomeView(),
    SizedBox(),
    SizedBox(),
  ];

  Map<String, String> bottomNavigationBarIcons = {
    'Search': "search",
    'Chat': "chat",
    'Home': "home",
    'Heart': "heart",
    'Profile': "profile"
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _rippleAnimation = Tween<double>(begin: 30, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onHideBorder.value = false;
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _onHideBorder.dispose();
    _pageIndex.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    _onHideBorder.value = true;
    _controller.forward();
    _pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundColor(),
          ValueListenableBuilder<int>(
            valueListenable: _pageIndex,
            builder: (context, pageIndex, child) {
              return _pages[pageIndex];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              height: kBottomNavigationBarHeight * 1.6,
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.016,
                ),
                child: Card(
                  color: context.colorScheme.onSurface.withOpacity(0.95),
                  shape: const StadiumBorder(),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _onHideBorder,
                    builder: (context, hideBorder, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return RippleTapWidget(
                            index: index,
                            onPressed: () => _onTap(index),
                            animation: _rippleAnimation,
                            width: _pageIndex.value == index ? 55 : 47,
                            height: _pageIndex.value == index ? 55 : 47,
                            enableRipple: _pageIndex.value == index,
                            hideBorder: hideBorder,
                            decoration: BoxDecoration(
                              color: _pageIndex.value == index && !hideBorder
                                  ? MoniepointColor.primaryColor
                                  : _pageIndex.value == 0
                                      ? Colors.black26
                                      : context.colorScheme.onSurface,
                              shape: BoxShape.circle,
                              border: hideBorder && _pageIndex.value == index
                                  ? Border.all(
                                      color: context.colorScheme.surface,
                                      width: 1,
                                    )
                                  : null,
                            ),
                            child: MoniepointIcons(
                              imageType: ImageType.svg,
                              svg: bottomNavigationBarIcons.values.toList()[index],
                              color: context.colorScheme.surface,
                              height: _pageIndex.value == index ? 28 : null,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ).slideInFromBottom(
              delay: 3000.ms, animationDuration: 2500.ms, begin: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
