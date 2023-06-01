import 'package:flutter/material.dart';

class AppTutorialScreens extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App tutorial'),
      ),
    );
  }
}
