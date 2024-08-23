import 'package:football_field_find/src/core/style/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_field_find/src/feature/main/view/pages/list_screen.dart';
import '../widgets/custom_tab_widget.dart';
import 'package:flutter/material.dart';
import '../../vm/main_vm.dart';
import 'map_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainVm = ref.watch(mainVMProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(16.h),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: SizedBox(
                height: 51.h,
                width: 364.w,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
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
                          width: 0.5,
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
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MapScreen(),
            ListScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            ref.read(mainVMProvider).setBottomNavigationBarCurrentIndex(index);
          },
          currentIndex: mainVm.bottomNavigationBarCurrentIndex,
          items: [
            BottomNavigationBarItem(
              icon: mainVm.bottomNavigationBarCurrentIndex == 0 ? AppImages.exploreIconSelected : AppImages.exploreIconUnselected,
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: mainVm.bottomNavigationBarCurrentIndex == 1 ? AppImages.favoriteIconSelected : AppImages.favoriteIconUnselected,
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: mainVm.bottomNavigationBarCurrentIndex == 2 ? AppImages.accountIconSelected : AppImages.accountIconUnselected,
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}

//Future<void> _fetchStadiums() async {
//     await AppRepositoryImpl().fetchStadiumWithId(id: 2);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _fetchStadiums(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text("Error: ${snapshot.error}");
//             } else {
//               return TextButton(
//                 onPressed: () {
//                   _fetchStadiums();
//                 },
//                 child: const Text("Press", style: TextStyle(color: Colors.black)),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
