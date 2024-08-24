import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_images.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTab;

  const CustomBottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(230, 235, 243, 0.5),
              blurRadius: 37.r,
              offset: const Offset(0, -12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            onTap: onTab,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: AppImages.exploreIconUnselected,
                activeIcon: AppImages.exploreIconSelected,
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: AppImages.favoriteIconUnselected,
                activeIcon: AppImages.favoriteIconSelected,
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: AppImages.accountIconUnselected,
                activeIcon: AppImages.accountIconSelected,
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
