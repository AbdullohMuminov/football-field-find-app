import "package:football_field_find/src/core/constants/context_extension.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter/material.dart";

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
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      );
}
