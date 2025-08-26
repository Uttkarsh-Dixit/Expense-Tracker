import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(colorSchemeSeed: Colors.orangeAccent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int counter=0;
  List<Color> colorList=[Colors.amber, Colors.redAccent];

  void increment () {
    setState(() {
      counter++;
    });
  }

  void decrement () {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Number Counter')),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colorList,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( 'The value now is $counter ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      icon: Icon(Icons.exposure_plus_1),
                      label: Text('Increase'),
                      onPressed: increment,
                    ),
                    SizedBox(width: 20,),
                    FilledButton.icon(
                      icon: Icon(Icons.exposure_minus_1),
                      label: Text('Decrease'),
                      onPressed: decrement,
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close),
        ),
      );
  }
}