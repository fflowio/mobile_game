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
  List<List<String>> _sets = [];
  int _fullSets = 0;
  int _coins = 120;

  Widget finishPage() {
    String result = "You completed $_fullSets sets!";

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

  Widget pageContents() {
    if (_showContents == "game") {
      return gamePage();
    } else if (_showContents == "finish") {
      return finishPage();
    } else {
      return welcome();
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

  bool typeMatch(setCard, newCard) {
    return setCard.substring(21, 24) == newCard.substring(21, 24);
  }

  bool categoryMatch(existingCard, newCard) {
    debugPrint(existingCard.substring(14, 21));
    return existingCard.substring(14, 21) == newCard.substring(14, 21);
  }

  bool cardCanGoInSet(String cardName, List<String> set) {
    if (set.length == 4) {
      return false;
    } else if (set.isEmpty) {
      return true;
    } else if (set.length == 1)  {
      if (categoryMatch(set[0], cardName)) {
        return true;
      } else if (typeMatch(set[0], cardName)) {
        return true;
      }
    } else if (categoryMatch(set[0], set[1])) {
      if(categoryMatch(set[0], cardName)) {
        return true;
      }
    } else if (typeMatch(set[0], set[1])) {
      if(typeMatch(set[0], cardName)) {
        return true;
      }
    }

    return false;
  }

  selectCard(String cardName) {
    addCardToNextAvailableSet(cardName);

    _coins -= 10;
    if (_coins == 0) {
      _showContents = "finish";
    }

    setState(() { });
    debugPrint("Select card $cardName");
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

  void resetGame() async {
    _showContents = "game";
    _set1 = [];
    _set2 = [];
    _set3 = [];
    _sets = [_set1, _set2, _set3];
    _fullSets = 0;
    _coins = 120;
    setState(() {  });
    debugPrint("Reset");
  }

  Column welcome() {
    return Column(
      children: [
        const SizedBox(height: 50),
        ImageHelpers.getPicture("assets/images/StoryboardAmico.svg", 300),
        const SizedBox(height: 50),
        Widgets.defaultButton(resetGame, "Start")
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
              Widgets.customAppBar(Game.name, _coins),
              Container(
                color: Colors.deepPurple,
                width: double.infinity,
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
