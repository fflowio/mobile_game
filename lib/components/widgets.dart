import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.indigo[800],
  );

  static ElevatedButton numberIcon(int coins) {
    const currencyCharacter = "\u20b5";
    var textString = "$currencyCharacter $coins";

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
          padding: const EdgeInsets.symmetric(vertical: 8),
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

  static Container imageHolder() {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1
        )
      ),
    );
  }

  static Padding setContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey,
              width: 4
          )
        ),
        child: Row(
          children: [
            Column(
              children: [
                imageHolder(),
                imageHolder()
              ]
            ),
            Column(
              children: [
                imageHolder(),
                imageHolder()
              ]
            )
          ]
        )
      )
    );
  }
}
