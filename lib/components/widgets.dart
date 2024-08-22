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
}