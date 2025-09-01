import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    final headingSize = size.width * 0.035;

    Widget infoColumn({
      required Widget button,
      required String text,
      required String description,
    }) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button,
              SizedBox(height: space),
              Text(
                text,
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: space),
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: space),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Different types of Buttons')),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      infoColumn(
                        button: ElevatedButton(
                          onPressed: () {},
                          child: Text('Elevated Button'),
                        ),
                        text: 'Elevated Button',
                        description:
                        'A button with elevation, providing visual depth.',
                      ),
                      infoColumn(
                        button: FilledButton(
                          onPressed: () {},
                          child: Text('Filled Button'),
                        ),
                        text: 'Filled Button',
                        description:
                        'A strongly colored button for important actions.',
                      ),
                      infoColumn(
                        button: TextButton(
                          onPressed: () {},
                          child: Text('Text Button'),
                        ),
                        text: 'Text Button',
                        description:
                        'A flat button, no elevation, used for low-emphasis actions..',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: space*2),
                OutlinedButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
