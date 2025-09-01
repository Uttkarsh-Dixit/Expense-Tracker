import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage ({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final fontSize = size.width * 0.02;
    // final space = size.height * 0.025;
    //     final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('Rows'),),
      body: Container(
        // width: size.width,
        // height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList),),
        child: Padding(padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  height: size.height,
              color: Colors.pink,
              child: Text('Row 1', style: TextStyle(
                  fontSize: fontSize*2,
                  fontWeight: FontWeight.w600
              ),
              ),
            ),
            ),
            Expanded(
                child: Container(
                  height: size.height,
              color: Colors.purple,
              child: Text('Row 2', style: TextStyle(
                  fontSize: fontSize*2,
                  fontWeight: FontWeight.w600
              ),
              ),
            ),
            ),
            Expanded(
                child:Container(
                  height: size.height,
                  color: Colors.deepPurple,
                  child: Text('Row 3', style: TextStyle(
                      fontSize: fontSize*2,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ),
            )
          ],
        )

          ,),
      ),
    );
  }
}