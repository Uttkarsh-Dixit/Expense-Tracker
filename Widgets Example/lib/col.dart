import 'package:flutter/material.dart';

class Col extends StatelessWidget {
  const Col({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    //     final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('How Columns Work')),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: Column(
              //                 mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Color(0xFF37fa8b),
                    child: Center(
                      child: Text(
                        'Column 1',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Color(0xFF26ced1),
                    child: Center(
                      child: Text(
                        'Column 2',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Color(0xFFd7edaf),
                    child: Center(
                      child: Text(
                        'Column 3',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: space * 2),
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