import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import '../../vm/main_vm.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainVm = ref.watch(mainVMProvider);
    return ListView.separated(
      padding: REdgeInsets.symmetric(horizontal: 25, vertical: 25),
      itemCount: mainVm.stadiumList?.length ?? 0,
      itemBuilder: (_, __){
        return CustomCardWidget(
          image: mainVm.stadiumList?[__].image,
          name: mainVm.stadiumList?[__].name,
          address: mainVm.stadiumList?[__].address,
          pricePerHour: mainVm.stadiumList?[__].pricePerHour,
          isAvailable: mainVm.stadiumList?[__].isAvailable,
        );
      },
      separatorBuilder: (_, __) {
        return 10.verticalSpace;
      },
    );
  }
}
