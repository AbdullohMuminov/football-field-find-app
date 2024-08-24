import '../widgets/custom_default_tab_controller_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        appBar: CustomDefaultTabControllerWidget(
          tabIndex: mainVm.tabIndex,
          onTab: (index) {
            ref.read(mainVMProvider).setTabIndex(index);
          },
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
