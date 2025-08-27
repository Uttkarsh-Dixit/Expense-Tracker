import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User input',
      theme: ThemeData(colorSchemeSeed: Colors.lightBlueAccent),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});


  @override
  State<InputPage> createState() {
    return _InputPageState() ;
  }
}

class _InputPageState extends State<InputPage> {

  final TextEditingController _controller = TextEditingController();

  int? val;
  String _displayText= '';

  void _echoText() {
    setState(() {
      val=int.parse(_controller.text);
      int dig=val!*val!;
      _displayText = "The square of $val is $dig ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Squaring the Number')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white60, Colors.white10]
          )
        ),
        child: Padding(padding: EdgeInsets.all(20.0),
      child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 170,
            child: TextField(

              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Input text',
                  border: UnderlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton(
              onPressed: _echoText,
              child: Text('Calculate',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
          ),
          const SizedBox(height: 24),
          Text(
            _displayText,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
      ),
      ),
      ),


      );
  }

}
