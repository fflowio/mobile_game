import 'package:flutter/material.dart';

import '../components/image_helpers.dart';
import '../components/widgets.dart';
import 'credits.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  static var name = "My Game";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String _showContents = "welcome";
  List<String> _set1 = [];
  List<String> _set2 = [];
  List<String> _set3 = [];

  Widget welcome() {
    return Column(
      children: [
        const SizedBox(height: 50),
        ImageHelpers.getPicture("assets/images/StoryboardAmico.svg", 300),
        const SizedBox(height: 50),
        Widgets.defaultButton(resetGame, "Start")
      ]
    );
  }

  void resetGame() async {
    debugPrint("Reset");
    setState(() => _showContents = "start");
  }

  Widget pageContents() {
    if (_showContents == "start") {
      return gamePage();
    } else {
      return welcome();
    }
  }

  Column wallet() {
    List<Widget> contents = [
      Widgets.setContainer(_set1),
      const SizedBox(height: 8),
      Widgets.setContainer(_set2),
      const SizedBox(height: 8),
      Widgets.setContainer(_set3)
    ];

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: contents
    );
  }

  Row gamePage() {
    debugPrint("Game");

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardsToChoose(),
          wallet()
        ]
    );
  }

  bool cardCanGoInSet(String cardName, List<String> set) {
    if (set.isEmpty) {
      return true;
    } else if (set.length == 4) {
      return false;
    } else {
      debugPrint("Set has 1 or more cards");
      return false;
    }
  }

  addCardToNextAvailableSet(String cardName) {
    //debugPrint(cardName);
    if (cardCanGoInSet(cardName, _set1)) {
      _set1.add(cardName);
    } else if (cardCanGoInSet(cardName, _set2)) {
      _set2.add(cardName);
    } else if (cardCanGoInSet(cardName, _set3)) {
      _set3.add(cardName);
    } else {
      debugPrint("CARD DOES NOT FIT ANYWHERE");
    }
  }

  selectCard(String cardName) {
    debugPrint("Select card $cardName");
    addCardToNextAvailableSet(cardName);

    setState(() {
      _set1;
      _set2;
      _set3;
    });
  }

  Column cardsToChoose() {
    return Column(
        children: [
          ImageHelpers.randomPictureLink(selectCard),
          const SizedBox(height: 10),
          ImageHelpers.randomPictureLink(selectCard),
          const SizedBox(height: 10),
          ImageHelpers.randomPictureLink(selectCard)
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          child: Column(
            children: [
              Widgets.customAppBar(Game.name, 40),
              Container(
                color: Colors.deepPurple,
                constraints: const BoxConstraints(maxHeight: 580),
                child: pageContents()
              )
            ]
          )
        )
      )
    );
  }
}
