import 'package:dix_flutter_tutorials/home_screen/lower_stack.dart';
import 'package:dix_flutter_tutorials/home_screen/upper_stack.dart';
import 'package:flutter/material.dart';

class Stacked extends StatelessWidget {
  const Stacked({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,

      children: [
        //First Container
        LowerStack(),
        //Overlapping (Top Container) part
        UpperStack()
      ],
    );
  }
}