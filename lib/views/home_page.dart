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
  int _coins = 45;
  String _showContents = "default";
  final List<String> _cards = [];

  changeContents(String newContents) {
    setState(() => _showContents = newContents);
  }

  selectCard(String cardName) {
    debugPrint("Select card $cardName");
    if (_coins >= 10) {
      _coins -= 10;
      _cards.add(cardName);

      setState(() {
        _coins;
        _cards;
      });
    }
    else {
      debugPrint("TODO what if there aren't enough coins?");
    }
  }

  Widget contentFinder() {
    if (_showContents == "three") {
      return threeCards();
    } else {
      return defaultContents();
    }

  }

  Column threeCards() {
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

  Column defaultContents() {
    return Column(
      children: [
        ImageHelpers.getPicture("assets/images/StoryboardAmico.svg", 300),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => changeContents("three"),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.purple.shade600)
          ),
          child: const Text(
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            "Start"
          )
        )
      ]
    );
  }

  Row coinRow() {
    String welcomeText = "Welcome to my game. Your goal is to buy images and collect them in sets. Here is your starting money!";

    if (_showContents == "three") {
      welcomeText = "There are three cards below. Some of them might be the same. Each one costs 10 coins. Click on a card to choose it for your sets.";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            welcomeText,
            softWrap: true,
            style: const TextStyle(fontSize: 15)
          )
        ),
        Widgets.numberIcon(_coins)
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
            const SizedBox(height: 20),
            coinRow(),
            const SizedBox(height: 20),
            contentFinder()
            //Credits.contents()
          ]
        ),
      )
    );
  }
}

