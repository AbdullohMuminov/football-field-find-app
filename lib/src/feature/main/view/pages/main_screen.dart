import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_field_find/src/core/style/app_images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../vm/main_vm.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainVm = ref.watch(mainVMProvider);

    return Scaffold(
      body: mainVm.screensList[mainVm.bottomNavigationBarCurrentIndex],
      bottomNavigationBar: SizedBox(
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
              onTap: (index) {
                ref.read(mainVMProvider).setBottomNavigationBarCurrentIndex(index);
              },
              currentIndex: mainVm.bottomNavigationBarCurrentIndex,
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
