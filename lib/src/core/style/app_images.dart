import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';
import "package:flutter_svg/svg.dart";

final class AppImages {
  const AppImages._();

  // *** svg images

  static final mapIconSelected = SvgPicture.asset(
    "assets/icons/map_icon_selected.svg",
    height: 16.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final mapIconUnselected = SvgPicture.asset(
    "assets/icons/map_icon_unselected.svg",
    height: 16.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final listIconSelected = SvgPicture.asset(
    "assets/icons/list_icon_selected.svg",
    height: 14.65.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final listIconUnselected = SvgPicture.asset(
    "assets/icons/list_icon_unselected.svg",
    height: 14.65.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final exploreIconSelected = SvgPicture.asset(
    "assets/icons/explore_icon_selected.svg",
    height: 20.h,
    width: 25.w,
    fit: BoxFit.cover,
  );

  static final exploreIconUnselected = SvgPicture.asset(
    "assets/icons/explore_icon_unselected.svg",
    height: 20.h,
    width: 25.w,
    fit: BoxFit.cover,
  );

  static final favoriteIconSelected = SvgPicture.asset(
    "assets/icons/favorite_icon_selected.svg",
    height: 20.h,
    width: 23.w,
    fit: BoxFit.cover,
  );

  static final favoriteIconUnselected = SvgPicture.asset(
    "assets/icons/favorite_icon_unselected.svg",
    height: 20.h,
    width: 23.w,
    fit: BoxFit.cover,
  );

  static final accountIconSelected = SvgPicture.asset(
    "assets/icons/account_icon_selected.svg",
    height: 20.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final accountIconUnselected = SvgPicture.asset(
    "assets/icons/account_icon_unselected.svg",
    height: 20.h,
    width: 16.w,
    fit: BoxFit.cover,
  );

  static final locationIcon = SvgPicture.asset(
    "assets/icons/location_icon.svg",
    height: 22.h,
    width: 22.w,
    fit: BoxFit.cover,
  );

  static final directionIcon = SvgPicture.asset(
    "assets/icons/direction_icon.svg",
    height: 18.h,
    width: 18.w,
    fit: BoxFit.cover,
  );

  static final stadiumLocationIcon = SvgPicture.asset(
    "assets/icons/stadium_location_icon.svg",
    height: 48.h,
    width: 42.w,
    fit: BoxFit.cover,
  );

  static final imageNotLoaded = Image.asset(
    "assets/images/image_not_loaded.png",
    height: 168.h,
    width: 140.w,
    fit: BoxFit.cover,
  );

}
