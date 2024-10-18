// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_theme.dart';
import 'package:madetoyese_assessment_mp/views/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  String? darkMapStyle;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  Future<void> loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString('assets/json/map_style.json');
  }

  @override
  Widget build(BuildContext context) {
    loadMapStyles();
    return MaterialApp(
      theme: MoniepointAppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Moniepoint assessment',
      home: const MainPage(),
    );
  }
}
