import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/style/app_images.dart';
import '../widgets/custom_tab_widget.dart';
import 'package:flutter/material.dart';
import '../../vm/main_vm.dart';
import 'list_screen.dart';
import 'map_screen.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainVm = ref.watch(mainVMProvider);

    return DefaultTabController(
      length: 2,
      initialIndex: mainVm.tabIndex,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
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
                                onTap: (index) {
                                  ref.read(mainVMProvider).setTabIndex(index);
                                },
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: Colors.transparent,
                                indicator: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 3),
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      blurRadius: 8,
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
                                    isSelected: mainVm.tabIndex == 0,
                                    text: "Map",
                                    selectedIcon: AppImages.mapIconSelected,
                                    unselectedIcon: AppImages.mapIconUnselected,
                                  ),
                                  CustomTabWidget(
                                    isSelected: mainVm.tabIndex == 1,
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
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MapScreen(),
            ListScreen(),
          ],
        ),
      ),
    );
  }
}
