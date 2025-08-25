import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second Page"),
          onPressed: () async {
            // 👇 Send "Uttkarsh" to SecondPage, wait for a result
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(name: "Uttkarsh"),
              ),
            );

            // 👇 Use the result after coming back
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You got back: $result")),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String name;   // 👈 This will hold data from HomePage

  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello $name 👋"),  // 👈 Using the data passed
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Send Result Back"),
              onPressed: () {
                // 👇 Pop (go back) AND send a value back
                Navigator.pop(context, "Thanks from $name");
              },
            ),
          ],
        ),
      ),
    );
  }
}
