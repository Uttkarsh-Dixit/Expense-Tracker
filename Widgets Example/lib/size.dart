import 'package:flutter/material.dart';

class Size {
  static late double width, height;

  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    width = mq.size.width;
    height = mq.size.height;
  }
}

