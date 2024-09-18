import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_helpers.dart';

class Widgets {
  static Padding linkWithText(String text, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(path)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
      )
    );
  }

  static Gradient coinGradient () {
    return const LinearGradient(
      colors: [Color(0xffff9300), Color(0xfff9d423), Color(0xfffffb00), Color(0xffffa500)],
      stops: [0, 0.4, 0.6, 1],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );
  }

  static TextStyle defaultTextStyle () {
    return const TextStyle(
      fontSize: 20,
      color: Colors. white
    );
  }

  static TextStyle strongTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.indigo[800],
  );

  static TextStyle celebrateTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.red[800],
  );

  static TextStyle subTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.yellowAccent,
  );

  static ElevatedButton defaultButton(dynamic onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.green.shade800)
      ),
      child: Text(
        style: Widgets.defaultTextStyle(),
        text
      )
    );
  }

  static onWidgetPressed() {
    debugPrint("Widget pressed");
  }

  static ElevatedButton numberIcon(int coins) {
    const currencyCharacter = "\u20b5";
    var textString = "$currencyCharacter$coins";

    return ElevatedButton(
      style: ButtonStyle(shape: iconShape()),
      onPressed: () => { debugPrint("Pressed coins, ignoring")},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: coinGradient(),
          borderRadius: const BorderRadius.all(Radius.circular(42.0)),
          border: Border.all(
            color: Colors.orangeAccent,
            width: 5
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            textString,
            textAlign: TextAlign.center,
            style: strongTextStyle
          )
        )
      )
    );
  }

  static WidgetStateProperty<OutlinedBorder> iconShape() {
    var shape = WidgetStateProperty.all<CircleBorder>(
      const CircleBorder(
        side: BorderSide(
          color: Colors.yellowAccent,
          width: 5
        )
      )
    );

    return shape;
  }

  static Container imageHolder(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1
        )
      ),
      child: child
    );
  }

  static GridView childrenForSet(set) {
    List<Widget> children = [];

    for (var cardPath in set) {
      children.add(ImageHelpers.getPicture(cardPath, 40));
    }

    // If the set is not full,
    // add empty text content to make sure the blank holder is drawn
    for (int i = 0; i <= (4 - set.length); i++) {
      children.add(const Text(""));
    }

    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      children: children
    );
  }

  static Padding setContainer(set) {
    Color borderColor = Colors.grey;
    if (set.length == 4) {
      borderColor = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor,
              width: 4
          )
        ),
        child: childrenForSet(set)
      )
    );
  }

  static Padding customAppBar(int coins) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
        AppBar(
          title: const Text("My Game"),
          actions: [
            Widgets.numberIcon(coins)
          ]
        )
    );
  }
}
