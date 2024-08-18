import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../feature/main/main_screen.dart';
import '../../feature/settings/theme_controller.dart';
import '../style/text_style.dart';

class AppMaterialContext extends ConsumerWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the ThemeController
    final themeController = ref.watch(themeControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.theme.copyWith(
        textTheme: const AppTextStyle(), // Apply your custom TextTheme here
      ),
      home: const MainScreen(),
    );
  }
}
