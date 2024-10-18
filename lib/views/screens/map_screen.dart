import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/floating_action_panel.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/map_marker_overlay.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/map_popup_overlay.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/widgets/app_search_bar.dart';

class MapHomeView extends StatefulWidget {
  const MapHomeView({super.key, this.darkMapStyle});
  final String? darkMapStyle;

  @override
  State<MapHomeView> createState() => MapSampleState();
}

class MapSampleState extends State<MapHomeView>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late AnimationController _animationController;
  late ValueNotifier<bool> _isExpanded;
  String? _darkMapStyle;

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(6.550260, 3.390040),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _isExpanded = ValueNotifier(true);
    _loadMapStyles();

    _animationController = AnimationController(
      vsync: this,
      duration: 700.ms,
      reverseDuration: 500.ms,
    );

    _animationController.addStatusListener((listener) {
      if (listener == AnimationStatus.dismissed) {
        _isExpanded.value = false;
      } else {
        _isExpanded.value = true;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  Future<void> _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/json/map_style.json');
  }

  Future<void> _applyMapStyle(GoogleMapController controller) async {
    if (_darkMapStyle != null) {
      controller.setMapStyle(_darkMapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _applyMapStyle(controller);
            },
          ),
          const FloatingActionPanel(),
          Positioned(
            left: 30,
            bottom: context.sizeHeight(0.11),
            child: PopupOverlay(
              animController: _animationController,
            ),
          ),
          const SearchBarWidget(),
          ValueListenableBuilder<bool>(
            valueListenable: _isExpanded,
            builder: (context, isExpanded, child) {
              return MapMarkerOverlay(
                isVisible: isExpanded,
              );
            },
          ),
        ],
      ),
    );
  }
}
