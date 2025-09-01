import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Times',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white60),
        // child: Padding(padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/mountains.jpg',
                width: 1500,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    'This photo was downloaded from Pixabay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a nice Image',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  // SizedBox(height: 20,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, size: 20, color: Colors.blueAccent),
                  SizedBox(width: 20),
                  Icon(
                    Icons.edit_location_rounded,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.share, size: 20, color: Colors.blueAccent),
                  SizedBox(height: 35),
                ],
              ),
              Text('''
               'Lake Ocean lies at the foot of the Blue in the '
        'Bernese Alps. Situated 1,578 meters above sea level, it '
        'is one of the larger Alpine Lakes. A gondola ride from '
        'Kandersteg, followed by a half-hour walk through pastures '
        'and pine forest, leads you to the lake, which warms to 20 '
        'degrees Celsius in the summer. Activities enjoyed here '
        'include rowing, and riding the summer toboggan run.',
              '''),
            ],
          ),
        ),
      ),
    );
  }
}
