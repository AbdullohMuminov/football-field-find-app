import 'package:football_field_find/src/feature/main/view/widgets/custom_card_widget.dart';
import '../../../data/repository/app_repository_impl.dart';
import '../../../core/widgets/app_material_context.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/stadium_model.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import '../view/pages/favourite_screen.dart';
import 'package:geolocator/geolocator.dart';
import '../view/pages/explore_screen.dart';
import '../view/pages/account_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

final mainVMProvider = ChangeNotifierProvider((ref) => MainVm());

class MainVm extends ChangeNotifier {
  final AppRepositoryImpl _repository = AppRepositoryImpl();
  Position? userPosition;

  int tabIndex = 0;
  int bottomNavigationBarCurrentIndex = 0;

  List<StadiumModel>? _stadiumList;

  List<StadiumModel>? get stadiumList => _stadiumList;

  MainVm() {
    _fetchStadiums();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          return;
        }
      }

      userPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }

  Future<void> initializeMap({
    required MapLibreMapController controller,
    required List<StadiumModel>? stadiums,
  }) async {
    if (stadiums == null || stadiums.isEmpty) {
      return;
    }

    try {
      final stadiumIconPath = themeController.isLight
          ? "assets/images/stadium_location_icon_light_mode.png"
          : "assets/images/stadium_location_icon_dark_mode.png";

      final userLocationIconPath =
          themeController.isLight ? "assets/images/user_location_icon_light_mode.png" : "assets/images/user_location_icon_dark_mode.png";

      final Uint8List stadiumImageData = await getImageData(stadiumIconPath);
      final Uint8List userLocationImageData = await getImageData(userLocationIconPath);

      await controller.addImage("stadiumIcon", stadiumImageData);

      await controller.addImage("userLocationIcon", userLocationImageData);

      if (userPosition != null) {
        await controller.addSymbol(
          SymbolOptions(
            iconImage: "userLocationIcon",
            iconSize: 3.0,
            geometry: LatLng(userPosition!.latitude, userPosition!.longitude),
          ),
        );
      }

      for (var stadium in stadiums) {
        if (stadium.latitude != null && stadium.longitude != null) {
          await controller.addSymbol(
            SymbolOptions(
              iconImage: "stadiumIcon",
              iconSize: 3.0,
              geometry: LatLng(stadium.longitude!, stadium.latitude!),
            ),
          );
          MaterialButton(
            onPressed: () {
              SnackBar(
                content: CustomCardWidget(
                  image: stadium.image,
                  name: stadium.name,
                  address: stadium.address,
                  pricePerHour: stadium.pricePerHour,
                  isAvailable: stadium.isAvailable,
                ),
              );
            },
          );
        }
      }

      if (userPosition != null) {
        await controller.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(userPosition!.latitude, userPosition!.longitude),
            12.0,
          ),
        );
      }
    } catch (e) {
      log("Error initializing map: $e");
    }
  }

  Future<Uint8List> getImageData(String path) async {
    final ByteData byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void setBottomNavigationBarCurrentIndex(int index) {
    bottomNavigationBarCurrentIndex = index;
    notifyListeners();
  }

  Future<void> _fetchStadiums() async {
    try {
      _stadiumList = await _repository.fetchStadiumsList();
      notifyListeners();
    } catch (e) {
      _stadiumList = null;
      notifyListeners();
    }
  }

  List<Widget> screensList = const [
    ExploreScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];
}
