// import 'package:dix_flutter_tutorials/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      theme: ThemeData(colorSchemeSeed: Colors.purpleAccent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Color> rang = [Colors.cyanAccent, Colors.pinkAccent];
  final int val = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Home Page")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: rang,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              OutlinedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text('Second Page'),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SecondPage(value: val),
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (_, animation, _, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: Icon(Icons.home),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key, required this.value});
  final int value;

  final List<Color> rang = [Colors.purpleAccent, Colors.orangeAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is the Second Page ')),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: rang)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Third Page'),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(name: 'Jacob'),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 50),
                  FilledButton.icon(
                    icon: Icon(Icons.home_filled),
                    label: Text('Home Page'),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key, required this.name});

  final String name;
  final List<Color> rang = [Colors.grey, Colors.lightGreen];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is the third page')),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: rang)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    label: Text('Previous Page'),
                    icon: Icon(Icons.arrow_back),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 50),
                  FilledButton.icon(
                    icon: Icon(Icons.home_filled),
                    label: Text('Home Page'),
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
