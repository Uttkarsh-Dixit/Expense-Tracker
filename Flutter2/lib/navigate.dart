import 'package:flutter/material.dart';

class Navigate{
  void onScreen(BuildContext context, Widget Function() screen){
    Navigator.pop(context);

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> screen()
        ));
  }

}