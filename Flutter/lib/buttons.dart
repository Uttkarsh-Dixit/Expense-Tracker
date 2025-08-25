import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(123, 132, 31, 32)),
      title: 'Buttons practice',
      home: const Scaffold(body: Buttons(),),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(4.00),
      child: Row(
        children: <Widget>[
          Spacer(),
          ButtonTypes(enabled: true),
          ButtonTypes(enabled: false),
          Spacer(),
        ],
      ),
    );
  }
}


class ButtonTypes extends StatelessWidget {
  const ButtonTypes({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed=enabled? (){}:null;
    return Padding(
        padding: const EdgeInsets.all(4.00),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: onPressed, child: Text('elevated')),
          OutlinedButton(onPressed: onPressed, child: Text('Outlined')),
          FilledButton(onPressed: onPressed, child: Text('Filled')),
          TextButton(onPressed: onPressed, child: Text('Text')),
          FilledButton.tonal(onPressed: onPressed, child: Text('Tonal')),
        ],
      ),
    );
  }
}