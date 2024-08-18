import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

final class AppImages {
  const AppImages._();

  // *** svg images

  static final mapIconSelected = SvgPicture.asset(
    "assets/icons/map_icon_selected.svg",
    height: 16.h,
    width: 16.w,
  );

  static final mapIconUnselected = SvgPicture.asset(
    "assets/icons/map_icon_unselected.svg",
    height: 16.h,
    width: 16.w,
  );

  static final listIconSelected = SvgPicture.asset(
    "assets/icons/list_icon_selected.svg",
    height: 14.65.h,
    width: 16.w,
  );

  static final listIconUnselected = SvgPicture.asset(
    "assets/icons/list_icon_unselected.svg",
    height: 14.65.h,
    width: 16.w,
  );

  static final exploreIconSelected = SvgPicture.asset(
    "assets/icons/explore_icon_selected.svg",
    height: 20.h,
    width: 25.w,
  );

  static final favoriteIcon = SvgPicture.asset(
    "assets/icons/favorite_icon_unselected.svg",
    height: 20.h,
    width: 23.w,
  );

  static final accountIconUnselected = SvgPicture.asset(
    "assets/icons/account_icon_unselected.svg",
    height: 20.h,
    width: 16.w,
  );

  static final locationIcon = SvgPicture.asset(
    "assets/icons/location_icon.svg",
    height: 22.h,
    width: 22.w,
  );

  static final directionIcon = SvgPicture.asset(
    "assets/icons/direction_icon.svg",
    height: 18.h,
    width: 18.w,
  );

  static final stadiumLocationIcon = SvgPicture.asset(
    "assets/icons/stadium_location_icon.svg",
    height: 48.h,
    width: 42.w,
  );

}
