import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/app_images.dart';
import 'package:flutter/material.dart';
import 'custom_tab_widget.dart';

class CustomDefaultTabControllerWidget extends StatelessWidget implements PreferredSizeWidget {
  final int tabIndex;
  final void Function(int index) onTab;

  const CustomDefaultTabControllerWidget({
    super.key,
    required this.tabIndex,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 12.r,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25, vertical: 17),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    child: SizedBox(
                      height: 51.h,
                      width: 364.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(2),
                          child: TabBar(
                            onTap: onTab,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 1.r,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 3),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 8.r,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                width: 0.5.w,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.all(Radius.circular(7.r)),
                            ),
                            labelColor: Theme.of(context).colorScheme.primary,
                            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                            tabs: [
                              CustomTabWidget(
                                isSelected: tabIndex == 0,
                                text: "Map",
                                selectedIcon: AppImages.mapIconSelected,
                                unselectedIcon: AppImages.mapIconUnselected,
                              ),
                              CustomTabWidget(
                                isSelected: tabIndex == 1,
                                text: "List",
                                selectedIcon: AppImages.listIconSelected,
                                unselectedIcon: AppImages.listIconUnselected,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.h);
}
