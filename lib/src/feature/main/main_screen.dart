import 'package:flutter/material.dart';
import 'package:football_field_find/src/core/constants/context_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Text",
          style: context.theme.textTheme.titleSmall, // it doesn't take mine????
        ),
      ),
    );
  }
}
