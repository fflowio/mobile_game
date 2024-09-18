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
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          child: Column(
            children: [
              Widgets.customAppBar("My game", 40),
              Container(
                color: Colors.deepPurple,
                constraints: const BoxConstraints(maxHeight: 580)
              )
            ]
          )
        )
      )
    );
  }
}
