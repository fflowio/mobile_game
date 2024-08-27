import 'package:flutter/material.dart';

import '../components/widgets.dart';

class Credits {
  static List<Widget> contents() {
    return [
      Widgets.linkWithText("Many thanks to StorySet for the illustrations", "https://storyset.com"),
      Widgets.linkWithText("Nature illustrations", "https://storyset.com/nature"),
      Widgets.linkWithText("Together illustrations", "https://storyset.com/together"),
      Widgets.linkWithText("Education illustrations", "https://storyset.com/education"),
      Widgets.linkWithText("People illustrations", "https://storyset.com/people"),
      Widgets.linkWithText("Process illustrations", "https://storyset.com/process")
    ];
  }

  static void onLocalPressed() {
    debugPrint("Local pressed");
  }
}
