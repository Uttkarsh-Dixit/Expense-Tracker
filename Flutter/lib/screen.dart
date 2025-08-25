// import 'package:dix_flutter_tutorials/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

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
  final int val=90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Home Page")),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: rang,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('The value is $val '),
                SizedBox(height:50),
                FilledButton(
                  child: Text('Second Page'),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            SecondPage(value: val)));
                  } ,
                ),
              ]
          ),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  SecondPage({super.key, required this.value});
  final int value;

  final List<Color> rang=[Colors.white60, Colors.black12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is the Second Page ')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: rang),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('Third Page'),
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ThirdPage(name: 'Jacob')
                          )
                      );
                    },
                  ),
                  SizedBox(width: 50),
                  FilledButton.tonal(
                    child: Text('Home Page'),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}

class ThirdPage extends StatelessWidget {
  ThirdPage ({super.key, required this.name});

  final String name;
  final List<Color> rang=[Colors.white60, Colors.black12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is the third page')),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: rang)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      child: Text('Previous Page'),
                      onPressed: () async {
                        Navigator.pop(context);
                      }
                  ),
                  SizedBox(width: 50),
                  FilledButton.tonal(
                    child: Text('Home Page'),
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}