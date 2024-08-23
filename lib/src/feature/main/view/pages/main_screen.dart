import 'package:flutter/material.dart';
import 'package:football_field_find/src/data/repository/app_repository_impl.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Future<void> _fetchStadiums() async {
    await AppRepositoryImpl().fetchStadiumWithId(id: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _fetchStadiums(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return TextButton(
                onPressed: () {
                  _fetchStadiums();
                },
                child: const Text("Press", style: TextStyle(color: Colors.black)),
              );
            }
          },
        ),
      ),
    );
  }
}

