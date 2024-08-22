import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelpers {
  static final List<String> categories = ["Rollers", "SportFamily", "SpringFlower"];
  static final List<String> allTypes = ["Amico", "Bro", "Cuate", "Pana", "Rafiki"];
  static final List<String> limitedTypes = ["Amico", "Bro", "Pana", "Rafiki"];
  static final _random = new Random();

  static Widget getPicture(String name, int height) {
    return SvgPicture.asset(name, height: height.toDouble());
  }

  static Widget randomPictureLink() {
    String category = categories[_random.nextInt(categories.length)];
    String type = "";

    if (category == "SpringFlower") {
      type = allTypes[_random.nextInt(allTypes.length)];
    } else {
      type = limitedTypes[_random.nextInt(limitedTypes.length)];
    }

    String name = "assets/images/$category$type.svg";
    debugPrint(name);
    return getPicture(name, 150);
  }
}
