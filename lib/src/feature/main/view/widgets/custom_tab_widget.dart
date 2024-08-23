import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

class CustomTabWidget extends StatelessWidget {
  final SvgPicture selectedIcon;
  final SvgPicture unselectedIcon;
  final String text;
  final bool isSelected;

  const CustomTabWidget({
    super.key,
    required this.text,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) => Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected ? selectedIcon : unselectedIcon,
            8.horizontalSpace,
            Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
