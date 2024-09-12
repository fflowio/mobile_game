import 'package:flutter/material.dart';

import '../components/image_helpers.dart';
import '../components/widgets.dart';
import 'credits.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Game")
      ),
      body: Center(
        child: Container(
          color: Colors.deepPurple,
          constraints: const BoxConstraints(maxWidth: 450)
        )
      )
    );
  }
}
