import 'package:flutter/material.dart';

import '../widgets/custom_card_widget.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((_,__){
        return const CustomCardWidget();
      }),
    );
  }
}
