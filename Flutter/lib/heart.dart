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

  String? emoji='♡ ♡';
  String? display='Not Liked';
  List<Color> colorList=[Colors.amber, Colors.redAccent];

  void fill() {
    setState(() {
      emoji='❤️ ❤️';
      display='Liked';
    });
  }

  void unfill() {
    setState(() {
      emoji='♡ ♡';
      display='Not Liked';
    });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Color Heart')),
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
                  Text('$display',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  SizedBox(height: 150),
                  Text('$emoji   $emoji',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          icon: Icon(Icons.check),
                          label: Text('Liked'),
                          onPressed: fill,
                      ),
                      SizedBox(width: 50),
                      ElevatedButton.icon(
                        icon: Icon(Icons.close),
                        label: Text('Remove'),
                        onPressed: unfill,
                      )
                    ],
                  )
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