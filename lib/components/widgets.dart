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

  static TextStyle largeTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.indigo[800],
  );

  static ElevatedButton numberIcon(int coins, dynamic onPressed) {
    const currencyCharacter = "\u20b5";
    var textString = "$currencyCharacter $coins";

    return ElevatedButton(
      style: ButtonStyle(shape: iconShape()),
      onPressed: onPressed(),
      child: Container(
        width: 82,
        height: 82,
        decoration: BoxDecoration(
          gradient: coinGradient(),
          borderRadius: const BorderRadius.all(Radius.circular(42.0)),
          border: Border.all(
            //color: Colors.amber.shade800,
            color: Colors.orangeAccent,
            width: 7
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            textString,
            textAlign: TextAlign.center,
            style: largeTextStyle
          )
        ),
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
}
