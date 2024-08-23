import "package:flutter/material.dart";
import "package:football_field_find/src/feature/main/view/pages/main_screen.dart";
import "../../feature/settings/inherited_theme_notifier.dart";
import "../../feature/settings/theme_controller.dart";

final ThemeController themeController = ThemeController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
    themeController: themeController,
    child: Builder(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: InheritedThemeNotifier.maybeOf(context)?.theme,
        home: const MainScreen(),
      ),
    ),
  );
}
