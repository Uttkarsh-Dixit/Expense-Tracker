import 'package:flutter/material.dart';
import 'package:dix_flutter_tutorials/size.dart';

// final size = MediaQuery.sizeOf(context);
final padding = Size.width * 0.05;
final space = Size.height * 0.02;
final fontSize = Size.width * 0.02;
// final headingSize= size.width*0.035;

mixin Tiles {

  Widget tile({
    required Widget button,
    required String text,
    // required int num,
  }) {
    return Padding(padding: EdgeInsets.all(padding/4),
      child: Container(
        color: Color(0xFFeb83db),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: Colors.black
            ),
            ),
            SizedBox(height: space),
            button,
          ],
        ),
      ),
    );
  }
}