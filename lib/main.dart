import 'package:flutter/material.dart';

import 'views/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Game.name,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const Game(),
    );
  }
}
