import 'package:flutter/material.dart';

import '../components/image_helpers.dart';
import '../components/widgets.dart';
import 'credits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _coins = 120;
  int _setCount = 0;
  String _showContents = "default";
  List<String> _set1 = [];
  List<String> _set2 = [];
  List<String> _set3 = [];

  changeContents(String newContents) {
    debugPrint("Change contents pressed $newContents");

    setState(() => _showContents = newContents);
  }

  resetGame() async {
    debugPrint("Reset");
    _coins = 120;
    _setCount = 0;
    _set1 = [];
    _set2 = [];
    _set3 = [];
    setState(() {  });

    changeContents("start");
  }

  addCardToNextAvailableSet(String cardName) {
    //debugPrint(cardName);
    if (cardCanGoInSet(cardName, _set1)) {
      _set1.add(cardName);
      if (_set1.length == 4) {
        _setCount += 1;
      }
    } else if (cardCanGoInSet(cardName, _set2)) {
      _set2.add(cardName);
      if (_set2.length == 4) {
        _setCount += 1;
      }
    } else if (cardCanGoInSet(cardName, _set3)) {
      _set3.add(cardName);
      if (_set3.length == 4) {
        _setCount += 1;
      }
    } else {
      debugPrint("CARD DOES NOT FIT ANYWHERE");
    }
  }

  bool cardCanGoInSet(String cardName, List<String> set) {
    if (set.isEmpty) {
      return true;
    } else if (set.length == 4) {
      return false;
    } else {
      if (categoryMatch(set[0], cardName)) {
        if (set.length == 1) {
          return true;
        } else if (categoryMatch(set[1], cardName)) {
          debugPrint("Matched category for 2/3 ");
          return true;
        }
      }
      else if (typeMatch(set[0], cardName)){
        if (set.length == 1) {
          return true;
        } else if (typeMatch(set[1], cardName)) {
          debugPrint("Matched type for 2/3");
          return true;
        }
      }
    }

    return false;
  }

  bool categoryMatch(setCard, newCard) {
    return setCard.substring(14, 21) == newCard.substring(14, 21);
  }

  bool typeMatch(setCard, newCard) {
    return setCard.substring(21, 24) == newCard.substring(21, 24);
  }

  selectCard(String cardName) {
    if (_coins >= 10) {
      _coins -= 10;
      addCardToNextAvailableSet(cardName);
      setState(() {
        _coins;
        _set1;
        _set2;
        _set3;
      });

      if (_coins == 0) {
        changeContents("finish");
      }
    }
    else {
      debugPrint("TODO what if there aren't enough coins?");
      changeContents("finish");
    }
  }

  Column chooseCards() {
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

  Widget finishPage() {
    String result = "You completed $_setCount set";
    if (_setCount > 1) {
      result += "s";
    }

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

  Widget contentBuilder() {
    //debugPrint(_showContents);
    if (_showContents == "start") {
      return gamePage();
    } else if (_showContents == "finish") {
      return finishPage();
    } else {
      return defaultContents();
    }
  }

  Row gamePage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        chooseCards(),
        wallet()
      ]
    );
  }

  Column defaultContents() {
    debugPrint("Default contents, will set start");
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [Widgets.numberIcon(_coins)]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            contentBuilder()
            //Credits.contents()
          ]
        ),
      )
    );
  }
}

