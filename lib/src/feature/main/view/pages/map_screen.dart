import 'package:football_field_find/src/core/widgets/app_material_context.dart';
import 'package:football_field_find/src/feature/main/vm/main_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:flutter/material.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainVM = ref.watch(mainVMProvider);
    final stadiums = mainVM.stadiumList;
    final userPosition = mainVM.userPosition;

    if (stadiums == null || stadiums.isEmpty && mainVM.userPosition == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return userPosition == null ? const Center(child: CircularProgressIndicator()) : Stack(
      children: [
        MaplibreMap(
          styleString: themeController.isLight
              ? "https://api.maptiler.com/maps/streets-v2-light/style.json?key=gtEmYBbQ622efGOl3jEM"
              : "https://api.maptiler.com/maps/streets-v2-dark/style.json?key=gtEmYBbQ622efGOl3jEM",
          initialCameraPosition: CameraPosition(
            target: LatLng(userPosition.latitude, userPosition.longitude),
            zoom: 5,
          ),
          onMapCreated: (MapLibreMapController controller) async {
            await mainVM.initializeMap(controller: controller, stadiums: stadiums);
          },
        ),
      ],
    );
  }
}
