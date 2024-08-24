import 'package:flutter/cupertino.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(

          ),
        ),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
