import 'package:dix_flutter_tutorials/home_scaffold.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Page',
      theme: ThemeData(colorSchemeSeed: Colors.grey),
      home: const HomeScaffold(),
    );
  }
}