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
  String _showContents = "welcome";
  List<String> _set1 = [];
  List<String> _set2 = [];
  List<String> _set3 = [];
  List<List<String>> _sets = [];
  int _fullSets = 0;

  void resetGame() async {
    debugPrint("Reset");

    _sets = [_set1, _set2, _set3];

    setState(() => _showContents = "start");
  }

  selectCard(String cardName) {
    debugPrint("Select card " + cardName);
    addCardToNextAvailableSet(cardName);

    setState(() {
      _set1;
      _set2;
      _set3;
    });

    if (_fullSets == 3) {
      setState(() => _showContents = "finish");
    }
  }

  addCardToNextAvailableSet(String cardName) {
    for (var set in _sets) {
      if (cardCanGoInSet(cardName, set)) {
        set.add(cardName);
        if (set.length == 4) {
          _fullSets += 1;
        }
        return;
      }
    }
  }

  bool categoryMatch(existingCard, newCard) {
    return existingCard.substring(14, 21) == newCard.substring(14, 21);
  }

  bool cardCanGoInSet(String cardName, List<String> set) {
    if (set.isEmpty) {
      return true;
    } else if (set.length == 4) {
      return false;
    } else {
      debugPrint("Set has 1 or more cards");
      if (categoryMatch(set[0], cardName)) {
        return true;
      } else {
        return false;
      }
    }
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

  Widget pageContents() {
    if (_showContents == "start") {
      return gamePage();
    } else if (_showContents == "finish") {
      return finishPage();
    } else {
      return welcome();
    }
  }

  Widget finishPage() {
    String result = "You completed the game!";

    List<Widget> children = [
      const SizedBox(height: 40),
      Text(
          "Congratulations!!",
          style: Widgets.celebrateTextStyle
      ),
      Text(result, style: Widgets.subTextStyle),
      const SizedBox(height: 40),
      Widgets.defaultButton(resetGame, "Play again"),
      const SizedBox(height: 40)
    ];

    children += (Credits.contents());

    return Column(
      children: children
    );
  }

  Column welcome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        ImageHelpers.getPicture("assets/images/StoryboardAmico.svg", 300),
        const SizedBox(height: 50),
        Widgets.defaultButton(resetGame, "Start"),
        const SizedBox(height: 50)
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
              Widgets.customAppBar(),
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
