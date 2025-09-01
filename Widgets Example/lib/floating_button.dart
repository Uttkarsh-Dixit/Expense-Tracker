import 'package:flutter/material.dart';


class FAB extends StatelessWidget {
  const FAB({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('Floating Action Button ')),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Floating Action Button',
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: space),
              Text(
                '''
          A FloatingActionButton (FAB) in Flutter is 
          a circular icon button that floats above the 
          content of a screen, typically in the 
          bottom-right corner, and represents the 
          primary action a user can take on that 
          particular screen.
           ''',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
