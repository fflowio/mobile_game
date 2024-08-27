import 'package:flutter/material.dart';

import '../components/widgets.dart';

class Credits {
  static Column contents() {
    debugPrint( "https://storyset.com/sport");

    return Column(
      children: [
        Widgets.linkWithText("Many thanks to StorySet for the illustrations", "https://storyset.com"),
        Widgets.linkWithText("Nature illustrations", "https://storyset.com/nature"),
        Widgets.linkWithText("Together illustrations", "https://storyset.com/together"),
        Widgets.linkWithText("Education illustrations", "https://storyset.com/education"),
        Widgets.linkWithText("People illustrations", "https://storyset.com/people"),
        Widgets.linkWithText("Process illustrations", "https://storyset.com/process")
      ]
    );
  }
}
