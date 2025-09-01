import 'package:dix_flutter_tutorials/buttons.dart';
import 'package:dix_flutter_tutorials/col.dart';
import 'package:dix_flutter_tutorials/row.dart';
import 'package:dix_flutter_tutorials/segmented_button.dart';
import 'package:dix_flutter_tutorials/tile.dart';
import 'package:dix_flutter_tutorials/floating_button.dart';
import 'package:dix_flutter_tutorials/grid_views.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with Tiles{
  const HomePage({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final fontSize = size.width * 0.02;
    // final space = size.height * 0.02;
    // final headingSize= size.width*0.035;

    return Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Padding(
          padding: EdgeInsets.all(padding/2),
          child: GridView.count(crossAxisCount: 2,
            childAspectRatio: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              // TILE 1 BUTTONS
              tile(
                  button: OutlinedButton.icon(
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: fontSize,
                    ),
                    label: Text(
                      'Know More..',
                      style: TextStyle(
                          fontSize: fontSize ,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ButtonsPage(colorList: colorList),
                        ),
                      );
                    },
                  ),
                  text: 'BUTTONS',
              ),
              // TILE 2 GRID VIEWS
              tile(
                  button: OutlinedButton.icon(
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: fontSize,
                    ),
                    label: Text(
                      'Know More..',
                      style: TextStyle(
                          fontSize: fontSize ,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GridViews(colorList: colorList),
                        ),
                      );
                    },
                  ),
                  text: 'GRID VIEWS',
              ),
              // TILE 3 FAB
              tile(button: OutlinedButton.icon(
                icon: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: fontSize ,
                ),
                label: Text(
                  'Know More..',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w100,
                      color: Colors.black
                  ),
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAB(colorList: colorList),
                    ),
                  );
                },
              ),
                  text: 'FAB',
              ),
              // TILE 4 COLUMNS
              tile(
                  button: OutlinedButton.icon(
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: fontSize,
                    ),
                    label: Text(
                      'Know More..',
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Col(colorList: colorList),
                        ),
                      );
                    },
                  ),
                  text: 'COLUMNS',
              ),
              // TILE 5 ROWS
              tile(
                  button: OutlinedButton.icon(
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: fontSize,
                    ),
                    label: Text(
                      'Know More..',
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RowPage(colorList: colorList),
                        ),
                      );
                    },
                  ),
                  text: 'ROWS',
              ),

              // TILE 6 SNACK-BAR
              tile(
                  button: OutlinedButton.icon(
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      size: fontSize,
                    ),
                    label: Text(
                      'Know More..',
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('This is how a snackBar looks.'),
                            action: SnackBarAction(label: 'Action',
                                onPressed: (){}
                            ),
                          )
                      );
                    },
                  ),
                  text: 'SNACK-BAR',
              ),

              // TILE 7 SEGMENTED BUTTON
              tile(
                button: OutlinedButton.icon(
                  icon: Icon(
                    Icons.arrow_right_alt_outlined,
                    size: fontSize,
                  ),
                  label: Text(
                    'Know More..',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w100,
                        color: Colors.black
                    ),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Segmented(colorList: colorList),
                      ),
                    );
                  },
                ),
                text: 'SEGMENTED BUTTON',
              ),
            ],
          ),
        )
    );
  }
}
