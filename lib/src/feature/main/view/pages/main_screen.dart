import '../widgets/custom_bottom_navigation_bar_widget.dart';
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
      bottomNavigationBar: CustomBottomNavigationBarWidget(
        currentIndex: mainVm.bottomNavigationBarCurrentIndex,
        onTab: (index) {
          ref.read(mainVMProvider).setBottomNavigationBarCurrentIndex(index);
        },
      ),
    );
  }
}
