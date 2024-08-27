import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelpers {
  static final List<String> categories = ["Rollers", "Journey", "SpringFlower"];
  static final List<String> allTypes = ["Amico", "Bro", "Cuate", "Pana", "Rafiki"];
  static final List<String> limitedTypes = ["Amico", "Bro", "Pana", "Rafiki"];
  static final _random = Random();

  static Widget getPicture(String name, int width) {
    return SvgPicture.asset(name, width: width.toDouble());
  }

  static Widget randomPictureLink(dynamic selectCard) {
    String category = categories[_random.nextInt(categories.length)];
    String type = "";

    if (category == "SpringFlower" || category == "Journey") {
      type = allTypes[_random.nextInt(allTypes.length)];
    } else {
      type = limitedTypes[_random.nextInt(limitedTypes.length)];
    }

    String name = "assets/images/$category$type.svg";
    debugPrint(name);
    return ElevatedButton(
      onPressed: () => selectCard(name),
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: Colors.purple.shade600,
              width: 4
            ),
          )
        )
      ),
      child: getPicture(name, 164)
    );
  }
}
