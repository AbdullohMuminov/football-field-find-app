import 'package:flutter/material.dart';
import 'package:football_field_find/src/core/widgets/app_material_context.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            themeController.switchTheme();
          },
          icon: const Icon(Icons.dark_mode_outlined),
        ),
      ),
    );
  }
}
